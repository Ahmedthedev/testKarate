import com.intuit.karate.junit5.Karate;

class RunnerTest {
    @Karate.Test
    Karate testFeature() {
        String featureFile = System.getProperty("karate.feature", "exo1.feature");
        return Karate.run("classpath:" + featureFile);
    }
}