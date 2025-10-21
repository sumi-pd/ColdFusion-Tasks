function validateForm() {
  let isValid = true;
  const errorDiv = document.getElementById("error-message");

  errorDiv.textContent = "";
  errorDiv.style.display = "none";
  document.querySelectorAll(".error").forEach(el => el.classList.remove("error"));

  const requiredFields = [
    "position", "month", "day", "year", "firstName", "lastName", "email",
    "phone-part1", "phone-part2", "phone-part3", "salaryDollars", "salaryCents"
  ];

  requiredFields.forEach(id => {
    const field = document.getElementById(id);
    if (!field || !field.value.trim()) {
      isValid = false;
      if (field) {
        field.classList.add("error");
      }
    }
  });

  const emailInput = document.getElementById("email");
  const emailValue = emailInput.value.trim();
  const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

  if (emailValue && !emailPattern.test(emailValue)) {
    isValid = false;
    emailInput.classList.add("error");
  }

  if (!isValid) {
    errorDiv.textContent = "Please fill out all required fields and provide valid information.";
    errorDiv.style.display = "block";
    document.querySelector(".error")?.focus();
  }

  return isValid;
}

$(function () {
  $('#hidden-datepicker').datepicker({
    dateFormat: 'mm/dd/yy',
    onSelect: function (dateText) {
      const [mm, dd, yy] = dateText.split('/');
      $('#month').val(mm);
      $('#day').val(dd);
      $('#year').val('20' + yy);
    }
  });

  $('#calendar-trigger').on('click', function () {
    $('#hidden-datepicker').datepicker('show');
  });
});

document.addEventListener('DOMContentLoaded', () => {
  const numericOnly = e => {
    e.target.value = e.target.value.replace(/\D/g, '');
  };

  ['salary-dollars', 'salary-cents', 'phone-part1', 'phone-part2', 'phone-part3']
    .forEach(id => {
      const el = document.getElementById(id);
      if (el) el.addEventListener('input', numericOnly);
    });
});

document.getElementById('employmentForm').addEventListener('submit', function (e) {
  e.preventDefault();
  if (!validateForm()) return;

  const formData = new FormData(this);

  const phone = `${formData.get('phone-part1')}-${formData.get('phone-part2')}-${formData.get('phone-part3')}`;
  let month = parseInt(formData.get('month'), 10);
  let day = parseInt(formData.get('day'), 10);
  let year = parseInt(formData.get('year'), 10);

  const monthStr = month.toString().padStart(2, '0');
  const dayStr = day.toString().padStart(2, '0');
  const startDate = `${dayStr}-${monthStr}-${year}`;

  formData.append('phone', phone);
  formData.append('startDate', startDate);

  fetch('23.cfc?method=saveFormData', {
    method: 'POST',
    body: formData
  })
  .then(res => res.text())
  .then(response => {
    alert("Form submitted successfully!");
    document.getElementById('employmentForm').reset();
  })
  .catch(err => alert("Error submitting form: " + err));
});
