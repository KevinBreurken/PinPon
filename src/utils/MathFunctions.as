package utils
{
	import flash.geom.Matrix;
	import flash.geom.Point;

	/**
	 * @author berendweij
	 */
	public class MathFunctions
	{
		public static var zeroPoint : Point = new Point(0, 0);

		/**
		 * Function to retrieve a angle between two points
		 *
		 * @example example:
		 * @param p1 : the first point to use for the angle calculation
		 * @param p2 : the second point to use for the angle calculation
		 * @return 
		 */
		public static function getAngle(p1 : Point, p2 : Point) : Number
		{
			var angle : Number = radToDeg(getRadianAngle(p1, p2));
			if(p2.x < p1.x) angle += 180;
			if(angle < 0) angle = 360 + angle;

			return angle;
		}

		/**
		 * Function to retrieve a angle between two points
		 *
		 * @example example:
		 * @param p1 : the first point to use for the angle calculation
		 * @param p2 : the second point to use for the angle calculation
		 * @return 
		 */
		public static function getRadianAngle(p1 : Point, p2 : Point) : Number
		{
			var angle : Number = (p2.y - p1.y) / (p2.x - p1.x);
			angle = Math.atan(angle);
			if(isNaN(angle)) angle = 0;
			return angle;
		}

		/**
		 * Function to calculate a quadratic curve
		 * @param p1 : the starting point
		 * @param p2 : the control point
		 * @param p3 : the end point
		 * @param t : the position in time (0 - 1)
		 * @return 
		 * 
		 */
		public static function quadratic(p1 : Point, p2 : Point, p3 : Point, t : Number) : Point
		{
			var x : Number = Math.pow((1 - t), 2) * p1.x + (2 * t) * (1 - t) * p2.x + Math.pow(t, 2) * p3.x;
			var y : Number = Math.pow((1 - t), 2) * p1.y + (2 * t) * (1 - t) * p2.y + Math.pow(t, 2) * p3.y;
			var point : Point = new Point(x, y);
			return point;
		}

		/**
		 * Function to calculate a cubic curve
		 * @param p1 : the starting point
		 * @param p2 : the first control point
		 * @param p3 : the second control point
		 * @param p4 : the end point
		 * @param t : the position in time (0 - 1)
		 * @return 
		 * 
		 */
		public static function cubic(p1 : Point, p2 : Point, p3 : Point, p4 : Point, t : Number) : Point
		{
			var x : Number = p1.x * Math.pow((1 - t), 3) + 3 * p2.x * t * Math.pow((1 - t), 2) + 3 * p3.x * Math.pow(t, 2) * (1 - t) + p4.x * Math.pow(t, 3);
			var y : Number = p1.y * Math.pow((1 - t), 3) + 3 * p2.y * t * Math.pow((1 - t), 2) + 3 * p3.y * Math.pow(t, 2) * (1 - t) + p4.y * Math.pow(t, 3);
			var point : Point = new Point(x, y);
			return point;
		}

		public static function linear(p1 : Point, p2 : Point, t : Number) : Point
		{
			return Point.interpolate(p1, p2, 1 - t);
		}

		public static function cartesianToPolar(point : Point) : Object
		{
			var r : Number = Math.sqrt(point.x * point.x + point.y * point.y);
			var a : Number = radToDeg(Math.atan2(point.y, point.x));
			return {r : r, a : a};
		}

		public static function radToDeg(angle : Number) : Number	// Radians --> degrees
		{
			return angle * (180 / Math.PI);
		}

		public static function degToRad(angle : Number) : Number	// degrees --> Radians
		{
			return angle * (Math.PI / 180);
		}

		public static function rotatePointAroundPoint(p : Point, center : Point, degree : Number) : Point
		{
			var np : Point = new Point();
			p.x += (0 - center.x);
			p.y += (0 - center.y);
			np.x = (p.x * Math.cos(degree * (Math.PI / 180))) - (p.y * Math.sin(degree * (Math.PI / 180)));
			np.y = Math.sin(degree * (Math.PI / 180)) * p.x + Math.cos(degree * (Math.PI / 180)) * p.y;
			np.x += (0 + center.x);
			np.y += (0 + center.y);

			return np;
		}

		public static function matrixRotationAroundPoint(angleDegrees : Number, ptRotationPoint : Point, targetMatrix : Matrix = null) : Matrix
		{
			var m : Matrix;
			if( targetMatrix )
			{
				m = targetMatrix;
			}
			else
			{
				m = new Matrix();
			}

			m.tx -= ptRotationPoint.x;
			m.ty -= ptRotationPoint.y;
			m.rotate(angleDegrees * (Math.PI / 180));
			m.tx += ptRotationPoint.x;
			m.ty += ptRotationPoint.y;
			return m;
		}

		/*
		 * Trigonometric functions
		 * 
		 * Sine	sin	opposite / hypotenuse	
		 * Cosine	cos	adjacent / hypotenuse	
		 * Tangent	tan (or tg)	opposite / adjacent	
		 * Cotangent	cot (or cotan or cotg or ctg or ctn)	adjacent / opposite	
		 * Secant	sec	hypotenuse / adjacent	
		 * Cosecant	csc (or cosec)	hypotenuse / opposite	
		 */
		public static function sec(a : Number) : Number
		{
			return 1 / Math.cos(a);
		}

		public static function round(num : Number, precision : int) : Number
		{
			var decimal : Number = Math.pow(10, precision);
			return Math.round(decimal * num) / decimal;
		}

		public static function rand(to : Number, from : Number = 0, decimalPlaces : Number = 0, weightedRange : Array = null, weightStrength : Number = 0) : Number
		{
			var ret : Number;
			if(to == from)
			{
				return(to);
			}

			if(weightedRange && Math.random() <= weightStrength)
			{
				ret = round(Math.random() * (weightedRange[1] - weightedRange[0]) + weightedRange[0], decimalPlaces);
			}
			else
			{
				ret = round(Math.random() * (to - from) + from, decimalPlaces);
			}
			return(ret);
		}

		public static function percentage(X : Number, minValue : Number, maxValue : Number) : Number
		{
			var divider:Number = maxValue - minValue;
			
			if ( divider == 0 )
				return 1;

			return (X - minValue) / divider;
		}
	}
}
