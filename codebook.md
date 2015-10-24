## Work Done to Clean Up Data
* merge data from test and train together
* merge measurement data with activities, volunteer IDs, and groups they are in(test or train)
* give this data frame column names
* change activities from number to readable character
* extract mean and standard deviation of measurements(use exact matching)
* group by volunteers and activities
* calculate the mean of each measurements for each volunteer on each activities
* write out to a text file

## Description of Variables
### ID
ID ranges from 1 to 30, stands for 30 volunteers in this project
### ACTIVITY
ACTIVITY show which activities these measurements belong to. There are six activities: walking, walking upstairs, walking downstairs, sitting, standing, laying.
### 66 features
These features are extracted from original data, and are means and stdvs for some measurement. For more details, you can read the feature_info.txt in the UCI HAR Dataset.
### GROUP
GROUP is to show whether this volunteer belong to the test group or train group.