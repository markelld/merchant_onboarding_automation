import { test, expect } from "@playwright/test";
import fs from "fs";

test("portal onboarding flow", async ({ page }) => {
  const intake = JSON.parse(fs.readFileSync("tmp/intake.json", "utf-8"));

  await page.goto("http://127.0.0.1:3000/portal/login");

  await page.getByTestId("portal-email").fill("admin@test.com");
  await page.waitForTimeout(300);

  await page.getByTestId("portal-password").fill("password");
  await page.waitForTimeout(300);

  await page.getByTestId("portal-login-submit").click();
  await page.waitForTimeout(500);

  await page.getByTestId("merchant-name").fill(intake.merchant_name);
  await page.waitForTimeout(300);

  await page.getByTestId("website").fill(intake.website);
  await page.waitForTimeout(300);

  await page.getByTestId("contact-name").fill(intake.contact_name);
  await page.waitForTimeout(300);

  await page.getByTestId("contact-email").fill(intake.contact_email);
  await page.waitForTimeout(300);

  await page.getByTestId("vertical").fill(intake.vertical || "");
  await page.waitForTimeout(300);

  await page.getByTestId("create-advertiser").click();
  await page.waitForTimeout(800);

  const advertiserId = (await page.getByTestId("advertiser-id").textContent())?.trim();

  await page.getByTestId("go-to-offer").click();
  await page.waitForTimeout(500);

  await page.getByTestId("offer-name").fill(intake.offer_name);
  await page.waitForTimeout(300);

  await page.getByTestId("payout-type").fill(intake.payout_type);
  await page.waitForTimeout(300);

  await page.getByTestId("payout-amount").fill(String(intake.payout_amount));
  await page.waitForTimeout(300);

  await page.getByTestId("tracking-method").fill(intake.tracking_method);
  await page.waitForTimeout(300);

  await page.getByTestId("create-offer").click();
  await page.waitForTimeout(800);

  const offerId = (await page.getByTestId("offer-id").textContent())?.trim();

  fs.writeFileSync(
    "tmp/portal_result.json",
    JSON.stringify({
      advertiser_external_id: advertiserId,
      offer_external_id: offerId
    })
  );

  await expect(page.getByTestId("offer-id")).toBeVisible();
});