$(function(){
  function buildHTML(comment){
    var html = `
                 
                <div class= "message-user">
                  <div class="fas fa-user-circle">
                  </div>
                 
                  <div class= "message-user-text">
                  ${comment.user_name} ${comment.text}
                        <div class= "message_icon">
                          <div class="messeage_icon_left>
                            <div class="icon-time>
                            <i class="far fa-clock">
                            </i>
                            ${comment.created_at}
                            <i class="far fa-flag"></i>
                            <a data-method='delete', href='/items/${comment.item_id}/comments/${comment.id}'>削除する</a>
                            <
                            </div>
                          </div>
                        </div>
                      </div>
                      </div>
                
                `
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.message_items').append(html);
      $('.textbox').val('');
      $('.message_content__box__form__submit').prop('disabled', false);
    })
});
})