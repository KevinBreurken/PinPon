package utils.calculate 
{
	/**
	 * ...
	 * @author Kevin Breurken
	 */
	public class Random 
	{
		
	public static function randomRange(minNum:Number, maxNum:Number):Number 
	{
		return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
	}
		
	}

}