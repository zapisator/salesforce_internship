public class VerifyDate
{
	
	/*
	** method to handle potential checks against two dates
	*/
	public static Date CheckDates(Date date1, Date date2)
	{
		/*
		** if date2 is within the next 30 days of date1, use date2.
		** Otherwise use the end of the month
		*/
		if (DateWithin30Days(date1,date2) == true)
			return (date2);
		return (SetEndOfMonthDate(date1));
	}
	
	/*
	** method to check if date2 is within the next 30 days of date1
	*/
	@TestVisible
	private static Boolean DateWithin30Days(Date date1, Date date2)
	{
		Date		date30Days;

		/*
		** check for date2 being in the past
		*/
		if (date2 < date1)
			return (false);
		
		/*
		** check that date2 is within (>=) 30 days of date1
		*/
		date30Days = date1.addDays(30); //create a date 30 days away from date1
		if (date2 >= date30Days)
			return (false);
		return (true);
	}

	/*
	** method to return the end of the month of a given date
	*/
	@TestVisible
	private static Date SetEndOfMonthDate(Date date1)
	{
		Integer		totalDays;
		Date		lastDay;

		totalDays = Date.daysInMonth(date1.year(), date1.month());
		lastDay = Date.newInstance(date1.year(), date1.month(), totalDays);
		return (lastDay);
	}

}