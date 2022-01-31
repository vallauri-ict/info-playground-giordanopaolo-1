CREATE TRIGGER [TriggerUpdate]
	ON [dbo].[Driver]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON
		declare @currDate date
		set @currDate = CURRENT_TIMESTAMP

		insert into StoricoAggiornamenti(number,full_name,country,date_birth,team_id,podiums_number,numberNew,full_nameNew, countryNew,date_birthNew,team_idNew, podiums_numberNew, [data]) 
		select d.*, i.*, @currDate from deleted d, inserted i 
		where d.number=i.number
	END
