using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MIS316_mp2Acrc4446 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnContinue_Click(object sender, EventArgs e)
    {
        //Hide the first panel and display the start over panel
        pnlContinue.Visible = false;
        pnlStartOver.Visible = true;

        // output the first and last name
        lblName.Text = txtLastName.Text + ", " + txtFirstName.Text;

        // output the major selected from the dropdownlist based on selected value
        if (ddlMajor.SelectedValue == "BA")
        {
            lblMajor.Text = "(Business Analytics)";
        }
        else if (ddlMajor.SelectedValue == "IT")
        {
            lblMajor.Text = "(Information Technology)";
        }
        else if (ddlMajor.SelectedValue == "MIS")
        {
            lblMajor.Text = "(Management Information Systems)";
        }
        // set the text property of each lable to default values as such
        lblNumberOfCourses.Text = "unknown";
        lblCurrentGpa.Text = "0.0";
        lblTotalCredits.Text = "0";

    }

    protected void lbAddANewCourse_Click(object sender, EventArgs e)
    {
        // display the AddANewCourse panel upon selecting the link button
        pnlAddANewCourse.Visible = true;
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        // Hide the AddANewCourse panel and clear out all input
        pnlAddANewCourse.Visible = false;
        txtCoursePrefix.Text = "";
        txtCourseNumber.Text = "";
        ddlGradeEarned.ClearSelection();
        
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // declare variables for each lable's text property
        string coursePrefix = txtCoursePrefix.Text;
        string courseNumber = txtCourseNumber.Text;
        string gradeEarned = ddlGradeEarned.SelectedItem.Text;
        // declare a variable for the concatenation of each variable
        string txtProp = coursePrefix + " " + courseNumber + " (" + gradeEarned + ")";

        // create a new list item and assign a text and value property based on input submitted
        ListItem liCourseGpa = new ListItem(txtProp, ddlGradeEarned.SelectedValue);
        // append the user input to the radioButtonList
        rblCourseHistory.Items.Add(liCourseGpa);

        // assign variables for the number of courses, total credits, current value, running total, current gpa
        int numOfCourses = 0;
        int totalCredits = 0;
        decimal decCurrent = 0m;
        decimal runningTotal = 0m;
        decimal currentGPA = 0m;

        // look at each list item in the total list of items and calculate the number of courses, and running total
        foreach (ListItem liNumber in rblCourseHistory.Items)
        {
            numOfCourses += 1;

            decCurrent = Convert.ToDecimal(liNumber.Value);

            runningTotal += decCurrent;

        }
        // calculate total credits and current gpa
        totalCredits = numOfCourses * 3;
        currentGPA = runningTotal / Convert.ToDecimal(numOfCourses);


        // output results to user
        lblNumberOfCourses.Text = numOfCourses.ToString();
        lblTotalCredits.Text = totalCredits.ToString();
        lblCurrentGpa.Text = currentGPA.ToString("0.00");

        // hide the addANewCourse panel upon new submission
        pnlAddANewCourse.Visible = false;

        // clear user input from prior submission
        txtCoursePrefix.Text = "";
        txtCourseNumber.Text = "";
        ddlGradeEarned.ClearSelection();

    }

    protected void rblCourseHistory_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Make the remove selected button appear upon selecting a radio button from the course history list.
        btnRemoveSelected.Visible = true;
    }

    protected void btnRemoveSelected_Click(object sender, EventArgs e)
    {
        // assign variables for the number of courses, total credits, current value, running total, current gpa
        int numOfCourses = 0;
        int totalCredits = 0;
        decimal decCurrent = 0m;
        decimal runningTotal = 0m;
        decimal currentGPA = 0m;

        // remove the selected course and hide the remove button upon removal
        rblCourseHistory.Items.RemoveAt(rblCourseHistory.SelectedIndex);
        btnRemoveSelected.Visible = false;

        // look at each list item in the total list of items and calculate the number of courses, and running total after removal
        foreach (ListItem liNumber in rblCourseHistory.Items)
        {
            numOfCourses += 1;

            decCurrent = Convert.ToDecimal(liNumber.Value);

            runningTotal += decCurrent;

        }
        // calculate total credits and current gpa
        totalCredits = numOfCourses * 3;
        // Check to see if the currentgpa is being divided by 0 and output 0.00 if that is the case
        try
        {
            currentGPA = runningTotal / Convert.ToDecimal(numOfCourses);

        }
        catch 
        {

            currentGPA = 0.00m;
        }

        // output results to user
        lblNumberOfCourses.Text = numOfCourses.ToString();
        lblTotalCredits.Text = totalCredits.ToString();
        lblCurrentGpa.Text = currentGPA.ToString("0.00");



    }

    protected void lbStartOver_Click(object sender, EventArgs e)
    {
        // Clear the start over panel of all input
        rblCourseHistory.Items.Clear();
        btnRemoveSelected.Visible = false;
        lblNumberOfCourses.Text = "";
        lblTotalCredits.Text = "";
        lblCurrentGpa.Text = "";
        pnlStartOver.Visible = false;

        // display and clear the continue panel of previous input
        pnlContinue.Visible = true;
        txtFirstName.Text = "";
        txtLastName.Text = "";
        ddlMajor.ClearSelection();
    }
}