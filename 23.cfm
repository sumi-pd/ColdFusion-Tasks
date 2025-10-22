<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Employment Application</title>
  <link rel="stylesheet" href="23-style.css" />
</head>
<body>

  <div class="header-logo">
    <img src="./images/wflogo-padding.png" alt="Company Logo">
  </div>

  <form id="employmentForm" method="post" enctype="multipart/form-data" action="23.cfc?method=saveFormData">

    <h2>Employment Application</h2>
    <p>Infinity Box Inc.</p>
    <div id="error-message"></div>

    <hr class="dotted-line" />

    <div class="form-group half-width">
      <label for="position">Which position are you applying for? <span class="required">*</span></label>
      <select id="position" name="position" required>
        <option value=""></option>
        <option value="Interface Designer">Interface Designer</option>
        <option value="Software Engineer">Software Engineer</option>
        <option value="System Administrator">System Administrator</option>
        <option value="Office Manager">Office Manager</option>
      </select>
    </div>

    <div class="form-group">
      <label>Are you willing to relocate? <span class="required">*</span></label>
      <label><input type="radio" name="relocate" value="Yes" required> Yes</label>
      <label><input type="radio" name="relocate" value="No"> No</label>
    </div>

    <div class="form-group">
      <label for="start-date">When can you start? <span class="required">*</span></label>
      <div class="date-inputs">
        <input id="month" name="month" type="text" maxlength="2" placeholder="MM" required />
        <span>/</span>
        <input id="day" name="day" type="text" maxlength="2" placeholder="DD" required />
        <span>/</span>
        <input id="year" name="year" type="text" maxlength="4" placeholder="YYYY" required />
        <button type="button" id="calendar-trigger" aria-label="Pick a date">
          <img src="./images/calendar.png" alt="">
        </button>
      </div>
    </div>

    <input type="text" id="hidden-datepicker" style="display: none;" />

    <div class="form-group">
      <label for="portfolio">Portfolio Website</label>
      <input type="url" id="portfolio" name="portfolio" value="http://">
    </div>

    <div class="form-group">
      <label for="resume">Attach a Copy of Your Resume</label>
      <input type="file" id="resume" name="resume" accept=".pdf,.doc,.docx" />
      <small>Word or PDF Documents Only</small>
    </div>

    <div class="form-group">
      <label for="salaryDollars">Salary Requirements</label>
      <div class="salary-inputs">
        <span>$</span>
        <div>
          <input id="salaryDollars" name="salaryDollars" type="text" maxlength="10" required />
          <label>Dollars</label>
        </div>
        <span>.</span>
        <div>
          <input id="salaryCents" name="salaryCents" type="text" maxlength="2" required />
          <label>Cents</label>
        </div>
      </div>
    </div>

    <hr class="dotted-line" />

    <h3>Your Contact Information</h3>

    <div class="form-group">
      <label for="firstName">Name <span class="required">*</span></label>
      <div class="name-inputs">
        <div>
          <input type="text" id="firstName" name="firstName" required />
          <label for="firstName">First</label>
        </div>
        <div>
          <input type="text" id="lastName" name="lastName" required />
          <label for="lastName">Last</label>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label for="email">Email Address <span class="required">*</span></label>
      <input type="email" id="email" name="email" required />
    </div>

    <div class="form-group">
      <label for="phone-part1">Phone Number <span class="required">*</span></label>
      <div class="phone-inputs">
        <div>
          <input type="tel" id="phone-part1" name="phone-part1" maxlength="3" required />
          <label for="phone-part1">###</label>
        </div>
        <span>-</span>
        <div>
          <input type="tel" id="phone-part2" name="phone-part2" maxlength="3" required />
          <label for="phone-part2">###</label>
        </div>
        <span>-</span>
        <div>
          <input type="tel" id="phone-part3" name="phone-part3" maxlength="4" required />
          <label for="phone-part3">####</label>
        </div>
      </div>
    </div>

    <button type="submit">Submit</button>

  </form>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <script src="23-script.js"></script>
</body>
</html>
