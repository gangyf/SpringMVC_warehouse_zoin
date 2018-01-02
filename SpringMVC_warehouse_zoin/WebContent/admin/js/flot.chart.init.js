
var data7_1=new Array();
var data7_2;
var data1=[];
var data2=[];
$(function() {
    $.ajax({  
        type: "post",
        url: "http://localhost:8080/SpringMVC_warehouse_zoin/allTimes",  
        contentType: false,  
        cache: false,  
        currentType: false,  
        processData: false,    
        success: function (res) {
        	var obj = jQuery.parseJSON(res);
        	
        	for (var i = 0; i < obj.time.length - 1; i++) {
                data1.push([obj.time[i], obj.innum[i]]);
                data2.push([obj.time[i], obj.outnum[i]]);
            }

        	
        	$.plot($("#visitors-chart #visitors-container"), [{
                data: data1,
                label: "入库次数",
                lines: {
                    fill: true
                }
            }, {
                data: data2,
                label: "出库次数",

                points: {
                    show: true
                },
                lines: {
                    show: true
                },
                yaxis: 2
            }
            ],
                {
                    series: {
                        lines: {
                            show: true,
                            fill: false
                        },
                        points: {
                            show: true,
                            lineWidth: 2,
                            fill: true,
                            fillColor: "#ffffff",
                            symbol: "circle",
                            radius: 5
                        },
                        shadowSize: 0
                    },
                    grid: {
                        hoverable: true,
                        clickable: true,
                        tickColor: "#f9f9f9",
                        borderWidth: 1,
                        borderColor: "#eeeeee"
                    },
                    colors: ["#65CEA7", "#424F63"],
                    tooltip: true,
                    tooltipOpts: {
                        defaultTheme: false
                    },
                    xaxis: {
                    	mode: "time",
                    	timeformat: "%m/%d",
                    },
                    yaxes: [{
                        /* First y axis */
                    }, {
                        /* Second y axis */
                        position: "right" /* left or right */
                    }]
                }
            );
        	
        	
        }  
    });
	
    

	

});


  
    $(function() {
        var data24Hours = [
            [0, 601],
            [1, 520],
            [2, 337],
            [3, 261],
            [4, 157],
            [5, 78],
            [6, 58],
            [7, 48],
            [8, 54],
            [9, 38],
            [10, 88],
            [11, 214],
            [12, 364],
            [13, 449],
            [14, 558],
            [15, 282],
            [16, 379],
            [17, 429],
            [18, 518],
            [19, 470],
            [20, 330],
            [21, 245],
            [22, 358],
            [23, 74]
        ];
        var data48Hours = [
            [0, 445],
            [1, 592],
            [2, 738],
            [3, 532],
            [4, 234],
            [5, 143],
            [6, 147],
            [7, 63],
            [8, 64],
            [9, 43],
            [10, 86],
            [11, 201],
            [12, 315],
            [13, 397],
            [14, 512],
            [15, 281],
            [16, 360],
            [17, 479],
            [18, 425],
            [19, 453],
            [20, 422],
            [21, 355],
            [22, 340],
            [23, 801]
        ];
        var dataDifference = [
            [23, 727],
            [22, 18],
            [21, 110],
            [20, 92],
            [19, 17],
            [18, 93],
            [17, 50],
            [16, 19],
            [15, 1],
            [14, 46],
            [13, 52],
            [12, 49],
            [11, 13],
            [10, 2],
            [9, 5],
            [8, 10],
            [7, 15],
            [6, 89],
            [5, 65],
            [4, 77],
            [3, 271],
            [2, 401],
            [1, 72],
            [0, 156]
        ];
        var ticks = [
            [0, "22h"],
            [1, ""],
            [2, "00h"],
            [3, ""],
            [4, "02h"],
            [5, ""],
            [6, "04h"],
            [7, ""],
            [8, "06h"],
            [9, ""],
            [10, "08h"],
            [11, ""],
            [12, "10h"],
            [13, ""],
            [14, "12h"],
            [15, ""],
            [16, "14h"],
            [17, ""],
            [18, "16h"],
            [19, ""],
            [20, "18h"],
            [21, ""],
            [22, "20h"],
            [23, ""]
        ];
        var data = [{
            label: "Last 24 Hours",
            data: data24Hours,
            lines: {
                show: true,
                fill: true
            },
            points: {
                show: true
            }
        }, {
            label: "Last 48 Hours",
            data: data48Hours,
            lines: {
                show: true
            },
            points: {
                show: true
            }
        }, {
            label: "Difference",
            data: dataDifference,
            bars: {
                show: true
            }
        }];
        var options = {
            xaxis: {
                ticks: ticks
            },
            series: {
                shadowSize: 0
            },
            grid: {
                hoverable: true,
                clickable: true,
                tickColor: "#f9f9f9",
                borderWidth: 1,
                borderColor: "#eeeeee"
            },
            colors: ["#6dc5a3", "#869cb3"],
            tooltip: true,
            tooltipOpts: {
                defaultTheme: false
            },
            legend: {
                labelBoxBorderColor: "#000000",
    container: $("#legendcontainer26"),
                noColumns: 0
            }
        };
        var plot = $.plot($("#combine-chart #combine-chartContainer"),
                data, options);
    });

    $(function() {
        var data1 = GenerateSeries(0);
        var data2 = GenerateSeries(100);
        var data3 = GenerateSeries(200);
        var dataset = [data1, data2, data3];
        function GenerateSeries(added) {
            var data = [];
            var start = 100 + added;
            var end = 200 + added;
            for (i = 1; i <= 100; i++) {
                var d = Math.floor(Math.random() * (end - start + 1) + start);
                data.push([i, d]);
                start++;
                end++;
            }
            return data;
        }
        var options = {
            series: {
                stack: true,
                shadowSize: 0
            },
            grid: {
                hoverable: true,
                clickable: true,
                tickColor: "#f9f9f9",
                borderWidth: 1,
                borderColor: "#eeeeee"
            },
            legend: {
                position: 'nw',
                labelBoxBorderColor: "#000000",
    container: $("#bar-chart #legendPlaceholder20"),
                noColumns: 0
            }
        };
        var plot;
        function ToggleSeries() {
            var d = [];
            $("#toggle-chart input[type='checkbox']").each(function() {
        if ($(this).is(":checked")) {
        var seqence = $(this).attr("id").replace("cbdata", "");
        d.push({
        label: "data" + seqence,
        data: dataset[seqence - 1]
        });
    }
    });
    options.series.lines = {};
    options.series.bars = {};
    $("#toggle-chart input[type='radio']").each(function() {
        if ($(this).is(":checked")) {
        if ($(this).val() == "line") {
        options.series.lines = {
        fill: true
        };
    } else {
        options.series.bars = {
            show: true
        };
    }
    }
    });
    $.plot($("#toggle-chart #toggle-chartContainer"), d, options);
        }
        $("#toggle-chart input").change(function() {
            ToggleSeries();
        });
        ToggleSeries();
    });
