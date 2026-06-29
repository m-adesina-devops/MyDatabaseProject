-- ============================================
-- Unit Test: Verify Customers table insert works
-- ============================================

-- 1. Pre-test: Setup test data
PRINT 'Setting up test data...';
DELETE FROM [dbo].[Customers] WHERE [Email] LIKE 'test.%';

-- 2. Test: Insert a test customer
PRINT 'Running test...';
INSERT INTO [dbo].[Customers] (
    [CustomerID],
    [FirstName],
    [LastName],
    [Email],
    [Phone],
    [Address],
    [LoyaltyTier]
)
VALUES (
    999999,
    'Test',
    'User',
    'test.user@example.com',
    '555-0000',
    '123 Test St',
    'Gold'
);

-- 3. Post-test: Verify the insert worked
PRINT 'Verifying results...';
SELECT 
    CASE 
        WHEN COUNT(*) = 1 THEN 'PASS: Customer inserted successfully'
        ELSE 'FAIL: Customer not found'
    END AS TestResult
FROM [dbo].[Customers]
WHERE [CustomerID] = 999999;

-- 4. Cleanup: Remove test data
PRINT 'Cleaning up...';
DELETE FROM [dbo].[Customers] WHERE [CustomerID] = 999999;
PRINT 'Test complete.';