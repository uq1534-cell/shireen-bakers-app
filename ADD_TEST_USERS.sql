-- ============================================================================
-- Add Test Users to Supabase
-- ============================================================================
-- IMPORTANT: First create the auth users in Supabase Dashboard, then run this SQL

-- Step 1: Go to https://app.supabase.com → Authentication → Users
-- Step 2: Click "Add User" and create these two users:
--
--   User 1:
--   Email: umer@gmail.com
--   Password: 123456
--
--   User 2:
--   Email: ibrahim@gmail.com
--   Password: 123456
--
-- Step 3: Copy the UUID (id) from each created user
-- Step 4: Replace UUID_FOR_UMER and UUID_FOR_IBRAHIM below with actual UUIDs
-- Step 5: Run this SQL in the SQL Editor

-- ============================================================================
-- INSERT TEST USER PROFILES
-- ============================================================================

-- User 1: Umer
INSERT INTO public.users (id, name, email, phone, address) VALUES (
  'UUID_FOR_UMER',  -- Replace with actual UUID from Supabase Auth Users list
  'Umer',
  'umer@gmail.com',
  '03215897477',
  'H-193 RWP Pakistan'
) ON CONFLICT (id) DO UPDATE SET
  name = 'Umer',
  email = 'umer@gmail.com',
  phone = '03215897477';

-- User 2: Ibrahim
INSERT INTO public.users (id, name, email, phone, address) VALUES (
  'UUID_FOR_IBRAHIM',  -- Replace with actual UUID from Supabase Auth Users list
  'Ibrahim',
  'ibrahim@gmail.com',
  '03001234567',
  'Rawalpindi Pakistan'
) ON CONFLICT (id) DO UPDATE SET
  name = 'Ibrahim',
  email = 'ibrahim@gmail.com',
  phone = '03001234567';

-- ============================================================================
-- DONE!
-- Now you can log in with:
-- Email: umer@gmail.com, Password: 123456
-- Email: ibrahim@gmail.com, Password: 123456
-- ============================================================================
