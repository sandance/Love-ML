# A dictionary of movie critics and their ratings of a small
# set of movies

from math import sqrt
# A dictionary of movie critics and their ratings of a small set of movies
critics = {
    'Lisa Rose': {
        'Lady in the Water': 2.5,
        'Snakes on a Plane': 3.5,
        'Just My Luck': 3.0,
        'Superman Returns': 3.5,
        'You, Me and Dupree': 2.5,
        'The Night Listener': 3.0,
    },
    'Gene Seymour': {
        'Lady in the Water': 3.0,
        'Snakes on a Plane': 3.5,
        'Just My Luck': 1.5,
        'Superman Returns': 5.0,
        'The Night Listener': 3.0,
        'You, Me and Dupree': 3.5,
    },
    'Michael Phillips': {
        'Lady in the Water': 2.5,
        'Snakes on a Plane': 3.0,
        'Superman Returns': 3.5,
        'The Night Listener': 4.0,
    },
    'Claudia Puig': {
        'Snakes on a Plane': 3.5,
        'Just My Luck': 3.0,
        'The Night Listener': 4.5,
        'Superman Returns': 4.0,
        'You, Me and Dupree': 2.5,
    },
    'Mick LaSalle': {
        'Lady in the Water': 3.0,
        'Snakes on a Plane': 4.0,
        'Just My Luck': 2.0,
        'Superman Returns': 3.0,
        'The Night Listener': 3.0,
        'You, Me and Dupree': 2.0,
    },
    'Jack Matthews': {
        'Lady in the Water': 3.0,
        'Snakes on a Plane': 4.0,
        'The Night Listener': 3.0,
        'Superman Returns': 5.0,
        'You, Me and Dupree': 3.5,
    },
    'Toby': {'Snakes on a Plane': 4.5, 'You, Me and Dupree': 1.0,
             'Superman Returns': 4.0},
}

#Return a distance based on similaritu score for p1 and p2

def sim_distance(prefs,p1,p2):
	#Get the list of shared items
	si ={}
	for item in prefs[p1]:
		if item in prefs[p2]:
			si[item]=1
	# if they have no rating in common , return 0
	if len(si)==0: return 0

	
	#Add up all the preferences
	sum1 = sum([prefs[p1][it] for it in si])
	sum2 = sum([prefs[p2][it] for it in si])
	
	
	


	#Add up the squares of all the differences 
	sum_of_squares=sum([pow(prefs[p1][item] -prefs[p2][item],2) for item in prefs[p1] if item in prefs[p2]])
	return 1/(1+sum_of_squares)




