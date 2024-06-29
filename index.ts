/**
 * Import function triggers from their respective submodules:
 *
 * import {onCall} from "firebase-functions/v2/https";
 * import {onDocumentWritten} from "firebase-functions/v2/firestore";
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

import {onRequest} from "firebase-functions/v2/https";
import * as logger from "firebase-functions/logger";
import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();

// Start writing functions
// https://firebase.google.com/docs/functions/typescript

export const helloWorld = onRequest((request, response) => {
  logger.info("Hello logs!", {structuredData: true});
  response.send("Hello from Firebase!");
});


// Define the type for the notification payload
interface NotificationPayload {
  title: string;
  body: string;
}

// Function to send a notification to a specific token
export const sendNotification = functions.https.onCall(async (data) => {
  const token = data.token;
  const payload: NotificationPayload = {
    title: data.title,
    body: data.body,
  };

  // Message format for FCM
  const message = {
    notification: payload,
    token: token,
  };

  try {
    const response = await admin.messaging().send(message);
    console.log("Successfully sent message:", response);
    return {success: true, response: response};
  } catch (error) {
    console.error("Error sending message:'", error);
    return {success: false, error: error};
  }
});

