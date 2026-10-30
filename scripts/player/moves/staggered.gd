extends Move

const ANIMATION_END = 1.0667

func default_lifecycle(input : InputPackage):
	if works_longer_than(ANIMATION_END):
		return best_input_that_can_be_paid(input)
	return "okay"
