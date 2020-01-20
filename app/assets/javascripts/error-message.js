$(document).on('turbolinks:load',function(){
    
    // 商品出品エラーメッセージ表示
    $(".sell-main__form").validate({
        rules: {
            "item[images][]": { required: true, minlength: 1, maxlength: 10 },
            "item[name]": { required: true, maxlength: 40 },
            "item[description]": { required: true, maxlength: 1000 },
            "item[category_id]": { required: true },
            "item[condition_id]": { required: true },
            "item[delivery_charge_id]": { required: true },
            "item[prefecture_id]": { required: true },
            "item[delivery_days_id]": { required: true },
            "item[price]": { required: true }
        },
        messages: {
            "item[images][]": { required: "画像がありません" },
            "item[name]": { required: "入力してください" },
            "item[description]": { maxlength: "1000文字以下で入力してください" },
            "item[category_id]":　{ reguired: true, choice: "選択してくだい" },
            "item[price]": { required: "300から9999999までの値を入力してください" },
            "item[category_id]": { required: "選択してください" },
            "item[condition_id]": { required: "選択してください" },
            "item[delivery_charge_id]": { required: "選択してください" },
            "item[prefecture_id]": { required: "選択してください" },
            "item[delivery_days_id]": { required: "選択してください" }
        }
    });
});