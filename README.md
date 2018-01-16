# Interval Exercising

Inspired by [this](https://www.gq.com/story/get-total-body-workout-in-7-minutes), but wanted to have more control over exercise duration and rests between exercises.

Requires the installation of [sox](http://sox.sourceforge.net/) with:
```bash
brew install sox
```
which is used to generate signal tones for exercise starts and finishes.

# Usage
```bash
$ ./interval_exercise.sh exercise_time rest_time
```
For 30 second exercises and 10 seconds between exercises:
```bash
$ ./interval_exercise.sh 30 10
```

# Editing Exercises
Editing exercises involves updating the `exercises` array in the file itself:
```bash
exercises= ( \
	"Jumping jacks" \
    "Wall sit" \
    ...
    "Planks" \
)
```

