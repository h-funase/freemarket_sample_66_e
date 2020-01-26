
$(function(){ 
    $("#例４表示位置").hover( 
        function(){ 
            var 代替画像 = $(this).attr("src")                        // Ａ
                .replace("called/image1.jpeg","called/image2.jpeg");  // Ｂ
            $(this).attr("src",代替画像);                        // Ｃ
        }, 
        function(){ 
            var ベース画像 = $(this).attr("src")
                .replace("called/image2.jpeg","called/image1.jpeg"); 
            $(this).attr("src",ベース画像); 
        } 
    ); 
}); 
