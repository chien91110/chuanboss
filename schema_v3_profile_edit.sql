-- =============================================
-- 川收 ChuanPOS 基本資料修改功能
-- 請在 Supabase SQL Editor 執行
-- =============================================

-- profiles 新增電話和解鎖相關欄位
ALTER TABLE profiles
  ADD COLUMN IF NOT EXISTS phone TEXT,
  ADD COLUMN IF NOT EXISTS profile_edit_unlocked_at TIMESTAMPTZ,
  ADD COLUMN IF NOT EXISTS profile_edit_count INTEGER DEFAULT 0;

-- 確認欄位已新增
SELECT column_name, data_type FROM information_schema.columns
WHERE table_name = 'profiles' AND table_schema = 'public'
  AND column_name IN ('phone', 'profile_edit_unlocked_at', 'profile_edit_count')
ORDER BY column_name;
