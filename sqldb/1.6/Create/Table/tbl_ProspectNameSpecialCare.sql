CREATE TABLE [dbo].[ProspectNameSpecialCare](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SpecialCare] [varchar](100) NULL
) ON [PRIMARY]

---------------

INSERT INTO ProspectNameSpecialCare
SELECT 'inc'
SELECT	'llc'
SELECT	'pvt. ltd'
SELECT	'pvt.ltd'
SELECT	'pvt ltd.'
SELECT	'pvt ltd'
SELECT	'llp'