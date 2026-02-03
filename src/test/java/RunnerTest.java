import com.intuit.karate.junit5.Karate;

class RunnerTest {
    @Karate.Test
    Karate exo1() {
        return Karate.run("classpath:exo1.feature");
    }

    @Karate.Test
    Karate exo2() {
        return Karate.run("classpath:exo2.feature");
    }

    @Karate.Test
    Karate exo3() {
        return Karate.run("classpath:exo3.feature");
    }
    
}