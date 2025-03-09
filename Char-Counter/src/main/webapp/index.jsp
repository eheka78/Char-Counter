<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Char-Counter</title>
</head>

<body style="margin:0; padding:0;">
	<!-- title -->
	<div style="width:100%; height:100%; background-color:#95B2F7; text-align:center; padding:0px;">
		<div style="display:flex; padding:30px 50px 30px 100px; font-size:25px; font-weight:bold;">Character-Counter</div>
	
	</div>
	
	
	<!-- screen -->
	<div style="display:grid; grid-template-columns:1fr 1fr; gap:5%; margin:50px 20%;">
		<!-- input -->
		<div>
			<textarea id="text_input" rows="25" style="width:calc(100% - 40px); resize:none; padding:20px;" placeholder="Write the text you want to count characters in."></textarea>
		</div>
		
		<!-- info -->
		<div style="width:100%;">
			<div style="display:grid; grid-template-rows:1fr 1fr 1fr; padding:0px;">
				<div style="margin:5px;">
					<span>공백 포함 글자수: </span><span id="char_include_blank_cnt">0</span>
				</div>
				<div style="margin:5px;">
					<span>공백 제외 글자수: </span><span id="char_except_blank_cnt">0</span>
				</div>
				<div style="margin:5px;">
					<span>단어 글자수: </span><span id="word_cnt">0</span>
				</div>
			</div>
			
			<div style="margin:20px 10px;">
				<div style="display:inline-block;">
					<button id="reset_btn" style="border-radius:15px; width:80px; height:25px; font-size:14px;">reset</button>
				</div>
				<div style="display:inline-block;">
					<button id="copy_btn" style="border-radius:15px; width:80px; height:25px; font-size:14px;">copy</button>
				</div>
			</div>
			
			
			<script>
				var text_input_div = document.getElementById("text_input");
				var char_include_blank_cnt_div = document.getElementById("char_include_blank_cnt");
				var char_except_blank_cnt_div = document.getElementById("char_except_blank_cnt");
				var word_cnt_div = document.getElementById("word_cnt");
				

				document.getElementById("reset_btn").addEventListener("click", function() {
					if(confirm("reset???")){
						console.log("reset");
						text_input_div.value = "";
						char_include_blank_cnt_div.innerText = 0;
						char_except_blank_cnt_div.innerText = 0;
						word_cnt_div.innerText = 0;
					}
				});
				
				/* 공백 포함 글자수 */
				function char_include_blank_cnt_change_cnt(){
					text_input_div = document.getElementById("text_input");
					
					if (!text_input_div || !char_include_blank_cnt_div) {
				        console.error("필요한 요소를 찾을 수 없습니다.");
				        return;
					}
					char_include_blank_cnt_div.innerText = text_input_div.value.length;
				}
				
				/* 공백 제외 글자수 */
				function char_except_blank_cnt_change_cnt(){
					char_except_blank_cnt_div.innerText = text_input_div.value.replace(/\s+/g, '').length;
				}
				
				/* 단어수 */
				function word_cnt_change_cnt(){
					word_cnt_div.innerText = text_input_div.value.trim().split(/\s+/g).length;
				}
				
				
				/* cnt 변경 func */
				function change_cnt(){
					text_input_div = document.getElementById("text_input");
					char_include_blank_cnt_change_cnt();
					char_except_blank_cnt_change_cnt();
					word_cnt_change_cnt();
				}
				
				text_input_div.addEventListener("input", change_cnt); /* textarea 변할 때마다 cnt 변경*/
				
				
				/* copy */
				document.getElementById("copy_btn").addEventListener("click", function() {
					text_input_div = document.getElementById("text_input");
			        
			        // Clipboard API 사용 (비동기적)
			        navigator.clipboard.writeText(text_input_div.value).then(function() {
			            alert("successfully copy text!\n: " + text_input_div.value);
			        }).catch(function(error) {
			            alert("복사 실패: " + error);
			        });
			    });
			</script>
		</div>	
	</div>
	
	<footer style="width:100%; font-size:13px;">
	<div style="text-align:center;">심심해서 만드는 toy project</div>	
	<div style="text-align:center; margin:5px;">
		<a href="https://github.com/eheka78/Char-Counter" style="text-decoration:none; color:black;">
			<img src="img/github_img.png" alt="github" style="height:20px; vertical-align:top;"><span> eheka78</span>
		</a>
	</div>
	</footer>
	
	<br><br><br>

</body>
</html>