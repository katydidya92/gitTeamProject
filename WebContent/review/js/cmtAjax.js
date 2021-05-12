$("#cmtCnt-btn").click(function() {
	$.ajax({
		url : "${contextPath }/CmtAdd.cmt",
		type : "POST",
		data : {
			cmt_content : $("#cmtCnt").val(),
			bbsID : '${bbsDetail.bbsID }'
		},
		success : function() {
			console.log("보내기 성공");
			location.reload()
		},
	})
});

$("#reCmt${vs.index}").click(function() {
	$(".hiddenReCmt").css("display", "none");
	$(".reCmt-hidden${vs.index}").css("display", "block");
});

$("#reCmtCnt-btn${vs.index}").click(function() {
	$.ajax({
		url : "${contextPath }/CmtReply.cmt",
		type : "POST",
		data : {
			cmt_content : $("#reCmtCnt${vs.index}").val(),
			cmtID : '${ct.cmtID}',
			cmt_seq : '${ct.cmt_seq }',
			cmt_lev : '${ct.cmt_lev }',
			cmt_ref : '${ct.cmt_ref }',
			cmt_seq : '${ct.cmt_seq }',
			bbsID : '${bbsDetail.bbsID }'
		},
		success : function() {
			console.log("보내기 성공");
			location.reload()
		},
	})
});

$('.tabActive${vs.index}').click(function() {
	if ($(this).hasClass('right-info')) {
		$('.cmt-content${vs.index}').hide();
		$('.fix-comment-hidden${vs.index}').show();
	}
	if ($(this).hasClass('fix-CmtBtn')) {
		$('.fix-comment-hidden${vs.index}').hide();
		$('.cmt-content${vs.index}').show();
	}
});

$("#fixCmtCnt-btn${vs.index}").click(function() {
	$.ajax({
		url : "${contextPath }/CmtModify.cmt",
		type : "POST",
		data : {
			cmt_content : $("#fixCmtCnt${vs.index}").val(),
			cmtID : '${ct.cmtID}',
			cmt_seq : '${ct.cmt_seq }',
			cmt_lev : '${ct.cmt_lev }',
			cmt_ref : '${ct.cmt_ref }',
			cmt_seq : '${ct.cmt_seq }',
			bbsID : '${bbsDetail.bbsID }'
		},
		success : function() {
			location.reload()
		},
	})
});

$("#delCmt${vs.index}").click(function() {
	if (confirm('정말 삭제하시겠습니까 ?') == true) {
		$.ajax({
			url : "/delComment.do",
			type : "POST",
			data : {
				num : '${ct.cmtID }'
			},
			success : function(data) {
				if (data == "false") {
					confirmDelete();
				}
				location.reload();
			},

		})
	}

});

function confirmDelete() {
	if ('${ct.cmtID }') {
		alert("댓글이 있는 게시글은 삭제할 수 없습니다.");
		return false;
	}
};

$('.fixTabActive${vs.index}').click(function() {
	if ($(this).hasClass('reCmtCnt-right-info')) {
		$('.reFixCmt-hiddenInfo${vs.index}').hide();
		$('.reFixCmt-hidden${vs.index}').show();
	}
	if ($(this).hasClass('reCmtBtn')) {
		$('.reFixCmt-hidden${vs.index}').hide();
		$('.reFixCmt-hiddenInfo${vs.index}').show();
	}
});

$("#reFixCmtCnt-btn${vs.index}").click(function() {
	$.ajax({
		url : "${contextPath }/CmtModify.cmt",
		type : "POST",
		data : {
			cmt_content : $("#fixCmtCnt${vs.index}").val(),
			cmtID : '${ct.cmtID}',
			cmt_seq : '${ct.cmt_seq }',
			cmt_lev : '${ct.cmt_lev }',
			cmt_ref : '${ct.cmt_ref }',
			cmt_seq : '${ct.cmt_seq }',
			bbsID : '${bbsDetail.bbsID }'
		},
		success : function() {
			console.log("보내기 성공");
			location.reload()
		},
	})
});

$("#reCmtCnt-del${vs.index}").click(function() {
	if (confirm('정말 삭제하시겠습니까 ?') == true) {
		$.ajax({
			url : "/CmtDelete.cmt",
			type : "POST",
			data : {
				cmtID : '${ct.cmtID}',
				bbsID : '${bbsDetail.bbsID }'
			},
			success : function() {
				console.log("보내기 성공");
				location.reload()
			},
		})
	}
});