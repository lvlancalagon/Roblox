# How to Set Up Donations for your Tycoon

To receive donations in Roblox, you need to create "Developer Products." These are items players can buy multiple times to support you.

## Step 1: Create a Developer Product
1. Go to the [Roblox Create Dashboard](https://create.roblox.com/dashboard/creations).
2. Click on your game (you must publish it first to see it here).
3. On the left sidebar, scroll down to **Monetization** and click **Developer Products**.
4. Click **Create Developer Product**.
5. Give it a name like "Support the Creator" and set a price (e.g., 50 Robux).
6. Click **Create**.

## Step 2: Get your Product ID
1. Once created, look at the list of Developer Products.
2. You will see a long number (the **Product ID**).
3. Copy this number.

## Step 3: Add it to your Code
1. Open the file `src/client/TycoonClient.client.lua`.
2. Find the section for donations.
3. Paste your ID into the `DONATION_PRODUCT_ID` variable.

## Step 4: Testing
- In Roblox Studio, you can test the donation button.
- It will show a "Test Purchase" window. You won't be charged real Robux while testing in Studio!

## Why have donations?
Donations help motivate you to keep updating the game! In a future update, we could add special "Supporter" badges or chat tags for players who donate.
