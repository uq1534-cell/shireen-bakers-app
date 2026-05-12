# How to Add Test Users to Supabase

## Problem
You're getting a rate limiting error because Supabase blocks too many signup attempts from the same email within a short time.

## Solution: Add Test Users Directly

### Option 1: Use Supabase Dashboard (Easiest) ✅ RECOMMENDED

**Step 1: Create Auth Users**
1. Go to [Supabase Dashboard](https://app.supabase.com)
2. Select your **shireen_bakers** project
3. Click **Authentication** → **Users**
4. Click **Add User** button

**Create User 1 - Umer:**
- Email: `umer@gmail.com`
- Password: `123456`
- Auto-generate password: OFF
- Click **Save**

**Step 2: Copy User IDs**
1. After creating both users, click on each one to view their details
2. Copy the **UUID** (it looks like: `a1b2c3d4-e5f6-7890-abcd-ef1234567890`)
3. Note: User 1 UUID = `UUID_FOR_UMER`, User 2 UUID = `UUID_FOR_IBRAHIM`

**Create User 2 - Ibrahim:**
- Email: `ibrahim@gmail.com`
- Password: `123456`
- Auto-generate password: OFF
- Click **Save**

**Step 3: Add User Profiles**
1. Open `ADD_TEST_USERS.sql` in your project
2. Replace `UUID_FOR_UMER` with the actual UUID from Step 2
3. Replace `UUID_FOR_IBRAHIM` with Ibrahim's UUID
4. Go to Supabase → **SQL Editor** → **New Query**
5. Paste the modified SQL
6. Click **Run**

**Example:**
```sql
INSERT INTO public.users (id, name, email, phone, address) VALUES (
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',  -- Replace with actual UUID
  'Umer',
  'umer@gmail.com',
  '03215897477',
  'H-193 RWP Pakistan'
);
```

---

### Option 2: Disable Email Confirmation (Faster Testing)

If you want to skip rate limiting altogether:

1. Go to Supabase → **Authentication** → **Providers** → **Email**
2. Toggle **Confirm email** to OFF
3. This allows instant signup without verification
4. You can now sign up with any email immediately

---

### Option 3: Wait 15 Minutes

After 15 minutes, the rate limit resets and you can try signing up again with a fresh email.

---

## Testing with Test Accounts

Once added, you can log in with:

**Account 1:**
- Email: `umer@gmail.com`
- Password: `123456`

**Account 2:**
- Email: `ibrahim@gmail.com`
- Password: `123456`

---

## Verify Users Were Created

**In Supabase:**
1. Go to **Table Editor**
2. Click `users` table
3. Verify you see both Umer and Ibrahim with their data

**In Your App:**
1. Hot reload the Flutter app
2. Go to Login screen
3. Enter: `umer@gmail.com` / `123456`
4. Should log in successfully ✅

---

## Troubleshooting

### Still getting rate limit error?
- Make sure 15 minutes have passed since last signup attempt
- Or disable email confirmation (Option 2 above)
- Or use the pre-created test accounts (Option 1 above)

### Users not appearing in Table Editor?
- Verify the UUID is correct (copy-paste from auth users)
- Check that SQL ran without errors
- Refresh the page

### Can't log in with test account?
- Verify email and password are exactly: `umer@gmail.com` / `123456`
- Check that user exists in **Authentication** → **Users**
- Check that user profile exists in **Table Editor** → `users` table
