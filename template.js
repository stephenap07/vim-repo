/* improved template.js for your health
 */

/* Rows example
 * var row = {
 *  event_type : {
 *    type : "begin", 
 *    innerHTML : '<input type="hidden" name="duty_type1"' + 
 *                'id="duty_type1"' + 
 *                'value="normal_service">' + 
 *                '<input type="hidden" name="event_type1"' + 
 *                'id="event_type1"' + 
 *                'value="begin_normal_service">';
 *  },  
 *  duty_type : "normal_service" 
 *  service_type : "covered", 
 *  location : "14201", 
 *  date : "2012-07-10", 
 *  time : "08:00",
 *  legend : "T1"
 * }
*/ 

function assertEquals(a, b) { 
  return a == b; 
}

var table = { 
  name   : "scheduleTable", 
  rows   : [], 
} 

var currentRow = table.row.length + 1; 
table.rows.push(getRow(duty_type;                                
                       getEventTypeCell("normal_service", "begin"),
                       getServiceTypeCell("normal_service", "begin"),
                       getLocationCell("normal_service", "begin"),
                       getDateCell("normal_service", "begin"),
                       getTimeCell("normal_service", "begin"),
                       getLegendCell("normal_service", "begin")
                       ); 
               ); 

function getRow(duty_type, event_type,
                service_type, location, 
                date, time, legend) { 
  var row = {}; 

  row.duty_type     = duty_type;  
  row.event_type    = event_type;  
  row.service_type  = service_type;  
  row.location      = location; 
  row.date          = date;  
  row.time          = time;  
  row.legend        = legend;  
  
  return row; 
}

function getHiddenField(type, value) { 
  var hidden  = '<input type="hidden" name="' + type + rows + '"' + 
                'id="' + type + rows + '"' + 
                'value="' + value + '">';
  return hidden; 
}

function getEventTypeCell(duty_type, event_type) { 
  event_obj = {}; 
  event.type = event_type; 
 
  hidden_field;  
  hidden_field2 = getHiddenField("duty_type", duty_type); 
}
 
