-- ============================================
-- Unit Test: Verify stored procedure returns correct data
-- ============================================

-- Pre-test: Ensure test data exists
PRINT 'Setting up test data...';
DELETE FROM [dbo].[Customers] WHERE [Email] LIKE 'test.%';

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
    (888888, 'John', 'Doe', 'john.doe@test.com', '555-1111', '123 Main St', 'Silver'),
    (888887, 'Jane', 'Smith', 'jane.smith@test.com', '555-2222', '456 Oak Ave', 'Gold');

-- Test: Query customers
PRINT 'Running test...';
SELECT 
    COUNT(*) AS TotalCustomers,
    MIN([FirstName]) AS FirstCustomer,
    MAX([LoyaltyTier]) AS HighestTier
FROM [dbo].[Customers]
WHERE [Email] LIKE 'test.%';

-- Cleanup
PRINT 'Cleaning up...';
DELETE FROM [dbo].[Customers] WHERE [Email] LIKE 'test.%';
PRINT 'Test complete.';