<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
  <style type="text/css">
    .input[readonly]{        /*只读时的颜色控制*/
      background-color: #ffffff;
    }
  </style>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>医生详情</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="">
      <div class="form-group">
        <div class="label">
          <label>医生编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="1001" name="number" data-validate="required:请输入编号" />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>姓名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="汤姆Tom" name="name" data-validate="required:请输入姓名" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>年龄：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="33" name="age" data-validate="required:请输入年龄" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>照片：</label>
        </div>
        <div class="field" id="photo">
              <img src="images/y.jpg " width="71px" height="99px">
        </div>
      </div>     
      
      <if condition="$iscid eq 1">
        <div class="form-group">
          <div class="label">
            <label>科室：</label>
          </div>
          <div class="field">
            <select name="sectionOffice" class="input w50">
              <option value="">请选择科室</option>
              <option value="">神经科</option>
              <option value="">骨科</option>
            </select>
            <div class="tips"></div>
          </div>
        </div>
        <div class="form-group">
          <div class="label">
            <label>主治方向：</label>
          </div>
          <div class="field">
            <input type="text" class="input w50" value="神经外科" name="direction" data-validate="required:请输入主治方向" />
          </div>
        </div>
        <div class="form-group">
          <div class="label">
            <label>联系电话：</label>
          </div>
          <div class="field">
            <input type="text" class="input w50" value="1234567890" name="tel" data-validate="required:请输入电话" />
          </div>
        </div>
        <div class="form-group">
          <div class="label">
            <label>邮箱：</label>
          </div>
          <div class="field">
            <input type="text" class="input w50" value="1223456@hp.com" name="mail" data-validate="required:请输入邮箱" />
          </div>
        </div>
        <div class="form-group">
          <div class="label">
            <label>办公地址：</label>
          </div>
          <div class="field">
            <input type="text" class="input w50" value="北京市人民医院神经外科808" name="place" data-validate="required:请输入地址" />
          </div>
        </div>
        <div class="form-group">
          <div class="label">
            <label>参加工作时长：</label>
          </div>
          <div class="field">
            <input type="text" class="input w50" value="10年" name="work" data-validate="required:请输入工作时长" />
          </div>
        </div>




        <!--<div class="form-group">
          <div class="label">
            <label>其他属性：</label>
          </div>
          <div class="field" style="padding-top:8px;"> 
            首页 <input id="ishome"  type="checkbox" />
            推荐 <input id="isvouch"  type="checkbox" />
            置顶 <input id="istop"  type="checkbox" /> 
         
          </div>
        </div>-->
      </if>
      <div class="form-group">
        <div class="label">
          <label>工作经历：</label>
        </div>
        <div class="field">
          <textarea name="content" class="input" style="height:450px; border:1px solid #ddd;">
            1、参与XX医院针灸门诊夏季进行的“冬病夏治”，穴位敷贴治咳嗽、哮喘的治疗实践和临床病例观察。

            2、参与XX医院针灸门诊冬季进行的“保健灸”疗法，对脾肾虚寒、手足寒冷等症状治疗实践并进行临床病例观察。

            3、参与XX医院针灸门诊进行的“针灸治疗面瘫”的病例收集和临床疗效观察。

            4、作为技术指导参与XX医院肝病病房进行的“腕踝针对减轻TACE术后反应”的临床疗效观察。
          </textarea>
          <div class="tips"></div>
        </div>
      </div>
     
      <div class="clear"></div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button border-red "  id="revamp"> 修改信息</button>
          <button class="button bg-main icon-check-square-o" type="submit" id="submit">提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
<script>
  $(document).ready(function(){
    $(".input").attr("readOnly","readonly");
  });

  $("#revamp").click(function(){
    $(".input").removeAttr("readOnly");
    $("#photo").html('<input type="text" id="url1" name="img" class="input tips" style="width:25%; float:left;"  value=""  data-toggle="hover" data-place="right" data-image="" /> <input type="button" class="button bg-blue margin-left" id="image1" value="+ 浏览上传"  style="float:left;"> <div class="tipss">图片尺寸：500*500</div>')
    return false;
  });

</script>
</body></html>