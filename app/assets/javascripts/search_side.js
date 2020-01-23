$(function () {
  $(".detail_search_clear_btn").on("click", function () {
      clearForm(this.form);
  });

  function clearForm (form) {
      $(form)
          .find("input, select, textarea")
          .not(":button, :submit, :reset, :hidden")
          .val("")
          .prop("checked", false)
          .prop("selected", false)
      ;

      $(form).find(":radio").filter("[data-default]").prop("checked", true);
  }
});