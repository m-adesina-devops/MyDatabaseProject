-- ============================================
-- Reset test data to known state
-- ============================================

PRINT 'Resetting test data...';

-- Delete all test data
DELETE FROM [dbo].[Customers] WHERE [Email] LIKE 'test.%';
DELETE FROM [dbo].[Customers] WHERE [CustomerID] > 999000;

-- Insert known test data
INSERT INTO [dbo].[Customers] (
    [CustomerID],
    [FirstName],
    [LastName],
    [Email],
    [Phone],
    [Address],
    [LoyaltyTier]
)
VALUES 
    (999998, 'Test', 'Admin', 'test.admin@example.com', '555-9999', '456 Test Ave', 'Platinum');

PRINT 'Reset complete.';