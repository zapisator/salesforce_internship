@isTest
public with sharing class TestVerifyDate
{

	@isTest(SeeAllData=true)
	static void testDateWithin30DaysReturnOfDate2IsWithin30daysOfDate1()
	{
		Boolean		reference;
		Date		date1;
		Integer		difference;
		Date		date2;
		Boolean		date2IsWithinNext30DaysOfDate1;

		reference = true;
		date1 = Date.newInstance(2020, 04, 20);
		difference = math.mod(15, 30);
		date2 = date1.addDays(difference);
		date2IsWithinNext30DaysOfDate1 =
			VerifyDate.DateWithin30Days(date1, date2);
		System.assertEquals(reference, date2IsWithinNext30DaysOfDate1);
	}

	@isTest(SeeAllData=true)
	static void testDateWithin30DaysReturnOfDate2IsAfter30daysOfDate1()
	{
		Boolean		reference;
		Date		date1;
		Integer		difference;
		Date		date2;
		Boolean		date2IsWithinNext30DaysOfDate1;

		reference = false;
		date1 = Date.newInstance(2020, 04, 20);
		difference = math.mod(15, 30) + 30;
		date2 = date1.addDays(difference);
		date2IsWithinNext30DaysOfDate1 =
			VerifyDate.DateWithin30Days(date1, date2);
		System.assertEquals(reference, date2IsWithinNext30DaysOfDate1);
	}

	@isTest(SeeAllData=true)
	static void testDateWithin30DaysReturnOfDate2IsBefore30daysOfDate1()
	{
		Boolean		reference;
		Date		date1;
		Integer		difference;
		Date		date2;
		Boolean		date2IsWithinNext30DaysOfDate1;

		reference = false;
		date1 = Date.newInstance(2020, 04, 20);
		difference = math.mod(15, 30) - 30;
		date2 = date1.addDays(difference);
		date2IsWithinNext30DaysOfDate1 =
			VerifyDate.DateWithin30Days(date1, date2);
		System.assertEquals(reference, date2IsWithinNext30DaysOfDate1);
	}

	@isTest(SeeAllData=true)
	static void testSetEndOfMonthDate()
	{
		Date		reference;
		Date		verifiable;

		reference = Date.newInstance(2020, 04, 30);
		verifiable = VerifyDate.SetEndOfMonthDate(reference);
		System.assertEquals(reference, verifiable);
	}

	@isTest(SeeAllData=true)
	static void testCheckDatesIsDateWithin30Days()
	{
		Date		date1;
		Integer		difference;
		Date		date2;
		Date		verifiable;
		Date		reference;

		date1 = Date.newInstance(2020, 04, 20);
		difference = math.mod(15, 30);
		date2 = date1.addDays(difference);
		verifiable = VerifyDate.CheckDates(date1, date2);
		reference = date2;
		System.assertEquals(reference, verifiable);
	}

	@isTest(SeeAllData=true)
	static void testCheckDatesIsNotDateWithin30Days()
	{
		Date		date1;
		Integer		difference;
		Date		date2;
		Date		verifiable;
		Date		reference;

		date1 = Date.newInstance(2020, 04, 20);
		difference = math.mod(15, 30) + 30;
		date2 = date1.addDays(difference);
		verifiable = VerifyDate.CheckDates(date1, date2);
		reference = Date.newInstance(2020, 04, 30);
		System.assertEquals(reference, verifiable);
	}
	
}
