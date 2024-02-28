<?php
// Check if $_GET['r'] is not set
if (!isset($_GET['r'])) {
  // If not set, exit
  exit;
}

$API_URL = "https://script.google.com/macros/s/AKfycbz1z9bPjL0gqjuRXFD4ylCt8xidfQnL8KcgGKCOGddt6LP2RrSbplfcUxn9xfI9TkzU/exec";
$TARGET_URL = file_get_contents($API_URL . "?r=" . $_GET['r']);

// Redirect to the target URL
header("Location: " . $TARGET_URL);
exit; // Make sure to stop script execution after the redirect