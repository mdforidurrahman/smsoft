<?php

namespace App\Services;

use Illuminate\Support\Facades\Log;

class SMSService
{
	protected $apiKey;
	protected $senderId;
	protected $baseUrl = 'http://bulksmsbd.net/api/';

	public function __construct() {
		$this->apiKey = config('sms.api_key');
		$this->senderId = config('sms.sender_id');
	}

	/**
	 * Send a single SMS
	 */
	public function sendSingleSMS(string $number, string $message): array {
		$url = $this->baseUrl . 'smsapi';

		$data = [
			'api_key' => $this->apiKey,
			'senderid' => $this->senderId,
			'number' => $number,
			'message' => $message,
			'type' => 'text'
		];

		return $this->sendRequest($url, $data);
	}

	/**
	 * Send multiple SMS messages
	 */
	public function sendMultipleSMS(array $messages): array {
		$url = $this->baseUrl . 'smsapimany';

		$data = [
			'api_key' => $this->apiKey,
			'senderid' => $this->senderId,
			'messages' => json_encode($messages)
		];

		return $this->sendRequest($url, $data);
	}

	/**
	 * Send sale confirmation SMS
	 */
	public function sendSaleConfirmation(string $customerNumber, string $customerName, array $saleDetails): array {
		$message = "Dear $customerName, thank you for your purchase!\n";
		$message .= "Order #: {$saleDetails['order_id']}\n";
		$message .= "Amount: {$saleDetails['amount']} BDT\n";
		$message .= "Items: {$saleDetails['item_count']}\n";

		if (isset($saleDetails['delivery_address'])) {
			$message .= "Delivery: {$saleDetails['delivery_address']}\n";
		}

		$message .= 'Contact us for any queries.';

		return $this->sendSingleSMS($customerNumber, $message);
	}

	/**
	 * Common request handler
	 */
	protected function sendRequest(string $url, array $data): array {
		try {
			$client = new \GuzzleHttp\Client();
			$response = $client->post($url, ['form_params' => $data]);

			$responseData = json_decode($response->getBody(), true);

			return [
				'success' => true,
				'data' => $responseData,
				'status' => $response->getStatusCode()
			];
		} catch (\Exception $e) {
			Log::error('SMS sending failed: ' . $e->getMessage());

			return [
				'success' => false,
				'error' => $e->getMessage(),
				'status' => $e->getCode() ?: 500
			];
		}
	}

	/**
	 * Get error message from code
	 */
	public function getErrorMessage(int $code): string {
		$errors = [
			202 => 'SMS Submitted Successfully',
			1001 => 'Invalid Number',
			// ... other error codes as shown in your documentation
		];

		return $errors[$code] ?? 'Unknown error';
	}
}