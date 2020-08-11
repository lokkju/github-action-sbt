object CubeCalculator extends App {
  def cube(x: Int) = {
    x * x * x
  }

  println(s"CubeCalculator 3 is ${CubeCalculator.cube(3)} ")
}