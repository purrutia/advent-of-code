# AOC 2022-01

def pushcalories(maxcalories, calories):
    # add calories to maxcalories if calories >= to any element
    for idx in range(len(maxcalories)):
        if maxcalories[idx] < calories:
            cal = maxcalories[idx]
            maxcalories[idx] = calories
            calories = cal

    return maxcalories

def calculate_calories(filename):
    # Define main variables
    calories = 0
    maxcalories = [0, 0, 0]

    # Open th file to read the lines
    with open(filename,'r') as inputfile:
        # Read each  lineof the file and store it as a list
        lines = inputfile.readlines()

        for line in lines:
            if line.startswith('\n'):
                maxcalories = pushcalories(maxcalories, calories)
                calories = 0
            else:
                calories += int(line.strip())

    # Last Elf
    maxcalories = pushcalories(maxcalories, calories)
    return maxcalories

if __name__ == "__main__":

    test_solution = calculate_calories("input.test")
    prod_solution = calculate_calories("input.prod")

    print("AoC 01A")
    print("Test: {}".format(test_solution[0]))
    print("Production: {}".format(prod_solution[0]))
    
    print("----------")

    print("AoC 01B")
    print("Test: {}".format(sum(test_solution)))
    print("Production: {}".format(sum(prod_solution)))
