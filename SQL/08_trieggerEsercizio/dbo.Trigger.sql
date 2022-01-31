CREATE TRIGGER [Trigger]
	ON [dbo].[Driver]
	FOR DELETE
	AS
	BEGIN
		SET NOCOUNT ON
		declare @currDate date
		set @currDate = CURRENT_TIMESTAMP
		insert into StoricoCancellazioni select d.number,d.full_name, d.country,d.date_birth, d.team_id, d.podiums_number, @currDate from deleted d
	END
