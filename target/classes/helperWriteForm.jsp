<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="Header.jsp"%>
    <!-- 본문 -->


<div class="mypage-navbar"></div>
    <div class="container">
        <div class="row writeForm ">
            <div class="col-md-3 order-1 order-md-1 d-flex justify-content-center">
                <img class="profile-img-box" src="https://www.klper.com/images/${sessionScope.userNumber}.png" 
                        onerror="javascript:src='https://www.klper.com/images/0.png'"
                    alt="profileImage">
            </div>
            <div class="col-md-9 order-2 order-md-2">
                <div class="media-body">
                    <div class="row">
                        <div class="col-md-6">
                            <h3 class="name-box">${sessionScope.userName}&nbsp;</h3>
                        </div>
                    </div>
                    <div class="writeFormContainer">
                        <div>
                           ${sessionScope.userPhone}&nbsp;
                        </div>
                    </div>
                    <form autocomplete="off" class="helper-write-form"  action="helperWriteForm.do" method="post">
                        <div class="row">
                            <div class="col-md-6 my-1">
                            <input name="uno" type="hidden" value="${sessionScope.userNumber}"/>
                            <input name="sta" type="hidden" id="date-result-start"/>
								<input name="end" type="hidden" id="date-result-end"/>                              
                                <input type="text" id="datepicker1" class="form-control"
                                    placeholder="Select available date" autocomplete="off">
                            </div>
                            <div class="col-md-6 my-1">
                                <select class="custom-select" name="lno">
                                    <option selected>Choose your language</option>
                               		<c:forEach items="${languageList}" var="language">
                                    <option value="${language.lno}">${language.language}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 my-1">
                                <select class="custom-select" name="rplace">
                                    <option selected>Choose your area</option>
                                   <c:forEach items="${seoulList}" var="seoul">
										<option value="${seoul.dno}">${seoul.district}</option>
									</c:forEach>
                                </select>
                            </div>
                            <div class="col-md-6 d-flex flex-column my-1">

                                <div class="btn-group btn-group-toggle sevice-tag-write-button" data-toggle="buttons">
                                    <label class="btn btn-secondary checkbox-btn">
                                        <input name="moving" type="checkbox" class="service" value="1" autocomplete="off"> moving
                                    </label>
                                    <label class="btn btn-secondary checkbox-btn">
                                        <input name="hospital" type="checkbox" class="service" value="1" autocomplete="off"> hospital
                                    </label>
                                    <label class="btn btn-secondary checkbox-btn">
                                        <input name="immigration" type="checkbox" class="service" value="1" autocomplete="off"> immigration
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group my-3">
                            <label for="detailReview">Additional Infomation</label>
                            <textarea id="detailReview" name="r_intro" class="form-control form-control-write"
                                rows="5"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary helper-button-main">Submit!</button>
                    </form>
                </div>

            </div>

        </div>
    </div>


<%@ include file="Footer.jsp"%>


<script>
var staEndPicker = new Lightpick({
	  field: document.getElementById('datepicker1'),
	  singleDate: false,
	  selectForward: true,
	  onSelect: function (start, end) {
	    var str = '';
	    var str2 = '';
	    str += start ? start.format('YYYY-MM-DD') + '' : '';
	    str2 += end ? end.format('YYYY-MM-DD') : '...';
	    document.getElementById('date-result-start').innerHTML = str;
	    document.getElementById('date-result-start').value = str;
	    document.getElementById('date-result-end').innerHTML = str2;
	    document.getElementById('date-result-end').value = str2;
	  }
	});
</script>