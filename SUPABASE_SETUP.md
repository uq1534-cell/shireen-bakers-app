# Supabase Database Setup Guide

## Issue
The error **"invalid input syntax for type uid: '!'"** occurs when:
1. The `users` table doesn't exist
2. The table columns have wrong types
3. Row Level Security (RLS) policies are not configured correctly
4. The `id` column isn't properly configured as a UUID

## Solution

### Step 1: Open Supabase SQL Editor
1. Go to your Supabase project: https://app.supabase.com
2. Navigate to **SQL Editor** → **New Query**

### Step 2: Run the Setup SQL
1. Open `SUPABASE_SETUP.sql` in this folder
2. Copy all the SQL code
3. Paste it into the Supabase SQL Editor
4. Click **Run**

### Step 3: Verify Tables Created
In Supabase, go to **Table Editor** and verify these tables exist:
- ✅ `users`
- ✅ `cart`
- ✅ `orders`
- ✅ `order_items`

### What the SQL Does
- Creates all 4 required tables with correct column types
- Sets up UUID primary keys
- Enables Row Level Security (RLS)
- Creates RLS policies so users can only see/modify their own data
- Creates indexes for better query performance

### Step 4: Test in Your App
1. Hot reload your Flutter app
2. Try signing up with a new email
3. Check the Supabase **Table Editor** to see if the user profile was created

## Troubleshooting

### Still getting "invalid input syntax for type uid" error?
- Make sure the `id` column is of type `uuid`, not `text` or `bigint`
- Check that RLS policies are enabled: go to **Authentication** → **Policies** for each table

### Data not appearing?
- Check **Authentication** → **Users** to verify the auth user was created
- Look at the browser console for error messages
- Enable realtime subscriptions if needed

### RLS Policy Issues?
- If you see "new row violates row-level security policy", the RLS is working but blocking inserts
- Make sure `auth.uid()` matches the `user_id` you're inserting

## Support
For more info on Supabase setup, see: https://supabase.com/docs
