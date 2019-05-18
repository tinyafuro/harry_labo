// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require moment
//= require fullcalendar
//= require bootstrap
//= require rails-ujs
//= require turbolinks
//= require_tree .


$(function () {

    // 画面遷移を検知
    $(document).on('turbolinks:load', function () {

      // lengthを呼び出すことで、#calendarが存在していた場合はtrueの処理がされ、無い場合はnillを返す
      if($('#calendar').length) {
        
        // FullCalendarを正しく読み込む関数
        function eventCalendar() {
            return $('#calendar').fullCalendar({});
        };

        // カレンダーが複数回表示されることを防ぐための関数
        function clearCalendar() {
            $('#calendar').html('');
        };

        // 上記関数を呼び出すコード
        $(document).on('turbolinks:load', function () {
          eventCalendar();
        });

        $(document).on('turbolinks:before-cache', clearCalendar);

        $('#calendar').fullCalendar({

          //読み込むイベント情報
          events: '/events.json',
          
          //カレンダー上部を年月で表示させる
          titleFormat: 'YYYY年 M月',
          //曜日を日本語表示
          dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
          
          // 選択可
          selectable: true,
          // 選択時にプレースホルダーを描画
          selectHelper: true,
          // 自動選択解除
          unselectAuto: true,
          // 自動選択解除対象外の要素
          unselectCancel: '',
          // 終日スロットを表示
          allDaySlot: true,
          
          //ボタンのレイアウト
          header: {
              left: '',
              center: 'title',
              right: 'today prev,next'
          },
          //終了時刻がないイベントの表示間隔
          defaultTimedEventDuration: '03:00:00',
          buttonText: {
              prev: '<',
              next: '>',
              prevYear: '前年',
              nextYear: '翌年',
              today: '今日',
              month: '月',
              week: '週',
              day: '日'
          },
          //イベントの時間表示を２４時間に
          timeFormat: "HH:mm",
          //イベントの色を変える
          eventColor: '#63ceef',
          //イベントの文字色を変える
          eventTextColor: '#000000',

          // 日付クリックイベント
          dayClick: function(date, allDay, jsEvent, view) {
            
            // クリックされた日付を取得
            var dateStr = moment(date).format( 'YYYY/MM/DD' );

            // eventコントローラーのnewアクションへリクエストを送る
            $.ajax({
              url: "events/new",
              type: "GET",
              data: {start_date : dateStr, end_date : dateStr},
              datatype: "html",
              
              // リクエスト後の戻り値
              success: function(data) {
                alert("予約が完了しました。");
                location.reload();
              },
              error: function(data) {
                  alert("予約済みの為、予約できませんでした。");
              }
            });
          }

        });
      }
    });
});