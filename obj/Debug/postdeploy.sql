MERGE INTO [dbo].[OrderStatuses] AS target
USING (VALUES
    (1, N'Pending'),
    (2, N'Processing'),
    (3, N'Shipped'),
    (4, N'Delivered'),
    (5, N'Cancelled')
) AS source ([StatusID], [StatusName])
ON target.[StatusID] = source.[StatusID]
WHEN MATCHED THEN
    UPDATE SET [StatusName] = source.[StatusName]
WHEN NOT MATCHED THEN
    INSERT ([StatusID], [StatusName])
    VALUES (source.[StatusID], source.[StatusName]);

MERGE INTO [dbo].[Regions] AS target
USING (VALUES
    (1, N'North America'),
    (2, N'Europe'),
    (3, N'Asia Pacific'),
    (4, N'South America')
) AS source ([RegionID], [RegionName])
ON target.[RegionID] = source.[RegionID]
WHEN MATCHED THEN
    UPDATE SET [RegionName] = source.[RegionName]
WHEN NOT MATCHED THEN
    INSERT ([RegionID], [RegionName])
    VALUES (source.[RegionID], source.[RegionName]);

GO
