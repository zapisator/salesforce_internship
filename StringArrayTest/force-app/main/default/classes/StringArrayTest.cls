public class StringArrayTest {
	
	public static List<String> generateStringArray(Integer listLen) {
			List<String> result = new List<String>();
			Integer i = 0;
			for (; listLen > 0; listLen--) {
				result.add('Test ' + i);
				System.debug(result[i++]);
			}
		return (result);
	}
}
