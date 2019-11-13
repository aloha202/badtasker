<div class="row">
    <!-- left column -->
    <div class="col-md-12">
<div class="box box-primary">
<form role="form" class="js-form-control" method="post" action="">



        <table class="my-form-table">
        <?php echo $form; ?>
        </table>


    <input type="submit" value="Создать" class="btn btn-primary">

</form>
</div>
    </div>
</div>


<script type="text/javascript">

    $(function () {

        $('#task_punishment').wrap("<div class='wrapper-relative'></div>");

        var options = "<option value=''>-- выбрать заготовку --</option>";
        <?php foreach($presets as $preset): ?>
            options += "<option value='<?php echo $preset->name; ?>'><?php echo $preset->name; ?>   </option>";
        <?php endforeach; ?>

        $('#task_punishment').parent().append(
            ("<select id='task_punishment_preset'>%options%</select>").replace('%options%', options)
        );

        $('#task_punishment_preset').change(function () {
            $('#task_punishment').val($(this).val());
        });

        $('#task_punishment_preset').css('left', ($('#task_punishment').width() - $('#task_punishment_preset').width() + 18));
    })



</script>