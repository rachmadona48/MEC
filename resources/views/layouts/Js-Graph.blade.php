<script>
    function f_pie_learning_type(id_pelajaran){
        // alert(id_pelajaran);
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/graph_subjek') }}",
            data: {_token:_token,id_pelajaran:id_pelajaran},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    f_pie_learning_type2(data.val_rwl,data.val_clb,data.val_dcs,data.val_ivt,data.val_pct,data.val_pdc)
                }
            },
            error: function(data){
                console.log(data);
            }
        });

    }

    function f_pie_learning_type2(val_rwl,val_clb,val_dcs,val_ivt,val_pct,val_pdc){
        var data = [
            {
                label: "Read Watch Listen",
                data: val_rwl,
                color: "#d3d3d3",
            }, {
                label: "Collaborate",
                data: val_clb,
                color: "#bababa",
            }, {
                label: "Discuss",
                data: val_dcs,
                color: "#79d2c0",
            }, {
                label: "Investigate",
                data: val_ivt,
                color: "#1ab394",
            }, {
                label: "Practice",
                data: val_pct,
                color: "#095aef",
            }, {
                label: "Produce",
                data: val_pdc,
                color: "#0c4061",
            }
        ];

        var plotObj = $.plot($("#pie_learning_type"), data, {
            series: {
                pie: {
                    show: true
                }
            },
            grid: {
                hoverable: true
            },
            tooltip: true,
            tooltipOpts: {
                content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
                shifts: {
                    x: 20,
                    y: 0
                },
                defaultTheme: false
            }
        });
    }
</script>