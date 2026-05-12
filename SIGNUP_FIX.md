# Fix Sign Up Email Rate Limiting

## Quick Fix: Disable Email Confirmation (Fastest)

1. Go to [https://app.supabase.com](https://app.supabase.com) → Your **shireen_bakers** project
2. Click **Authentication** → **Providers** 
3. Click **Email** provider
4. Toggle **Confirm email** → **OFF**
5. Click **Save**

Now users can sign up instantly without email verification! ✅

---

## Why This Helps:
- No rate limiting on email confirmations
- Users can sign up immediately
- Perfect for testing/development

## After Testing:
When you go live, toggle it back ON for production security.

---

## Alternative: Manual User Creation

If you want to test before enabling signup:

1. Go to **Authentication** → **Users**
2. Click **Add User** and create test users manually
3. Users can then log in with those credentials

Test logins:
- Email: `umer@gmail.com` | Password: `123456`
- Email: `ibrahim@gmail.com` | Password: `123456`
