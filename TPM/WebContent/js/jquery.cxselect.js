/*!
 * jQuery cxSelect
 * @name jquery.cxselect.js
 * @version 1.4.2
 * @date 2017-09-26
 * @author ciaoca
 * @email ciaoca@gmail.com
 * @site https://github.com/ciaoca/cxSelect
 * @license Released under the MIT license
 */
(function(factory) {
  if (typeof define === 'function' && define.amd) {
    define(['jquery'], factory);
  } else {
    factory(window.jQuery || window.Zepto || window.$);
  };
}(function($) {
  var cxSelect = function() {
    var self = this;
    var dom, settings, callback;

    // 鍒嗛厤鍙傛暟
    for (var i = 0, l = arguments.length; i < l; i++) {
      if (cxSelect.isJquery(arguments[i]) || cxSelect.isZepto(arguments[i])) {
        dom = arguments[i];
      } else if (cxSelect.isElement(arguments[i])) {
        dom = $(arguments[i]);
      } else if (typeof arguments[i] === 'function') {
        callback = arguments[i];
      } else if (typeof arguments[i] === 'object') {
        settings = arguments[i];
      };
    };

    var api = new cxSelect.init(dom, settings);

    if (typeof callback === 'function') {
      callback(api);
    };

    return api;
  };

  cxSelect.isElement = function(o){
    if (o && (typeof HTMLElement === 'function' || typeof HTMLElement === 'object') && o instanceof HTMLElement) {
      return true;
    } else {
      return (o && o.nodeType && o.nodeType === 1) ? true : false;
    };
  };

  cxSelect.isJquery = function(o){
    return (o && o.length && (typeof jQuery === 'function' || typeof jQuery === 'object') && o instanceof jQuery) ? true : false;
  };

  cxSelect.isZepto = function(o){
    return (o && o.length && (typeof Zepto === 'function' || typeof Zepto === 'object') && Zepto.zepto.isZ(o)) ? true : false;
  };

  cxSelect.getIndex = function(n, required) {
    return required ? n : n - 1;
  };

  cxSelect.getData = function(data, space) {
    if (typeof space === 'string' && space.length) {
      space = space.split('.');
      for (var i = 0, l = space.length; i < l; i++) {
        data = data[space[i]];
      };
    };
    return data;
  };

  cxSelect.init = function(dom, settings) {
    var self = this;

    if (!cxSelect.isJquery(dom) && !cxSelect.isZepto(dom)) {return};

    var theSelect = {
      dom: {
        box: dom
      }
    };

    self.attach = cxSelect.attach.bind(theSelect);
    self.detach = cxSelect.detach.bind(theSelect);
    self.setOptions = cxSelect.setOptions.bind(theSelect);
    self.clear = cxSelect.clear.bind(theSelect);

    theSelect.changeEvent = function() {
      cxSelect.selectChange.call(theSelect, this.className);
    };

    theSelect.settings = $.extend({}, $.cxSelect.defaults, settings, {
      url: theSelect.dom.box.data('url'),
      emptyStyle: theSelect.dom.box.data('emptyStyle'),
      required: theSelect.dom.box.data('required'),
      firstTitle: theSelect.dom.box.data('firstTitle'),
      firstValue: theSelect.dom.box.data('firstValue'),
      jsonSpace: theSelect.dom.box.data('jsonSpace'),
      jsonName: theSelect.dom.box.data('jsonName'),
      jsonValue: theSelect.dom.box.data('jsonValue'),
      jsonSub: theSelect.dom.box.data('jsonSub')
    });

    var _dataSelects = theSelect.dom.box.data('selects');

    if (typeof _dataSelects === 'string' && _dataSelects.length) {
      theSelect.settings.selects = _dataSelects.split(',');
    };

    self.setOptions();
    self.attach();

    // 浣跨敤鐙珛鎺ュ彛鑾峰彇鏁版嵁
    if (!theSelect.settings.url && !theSelect.settings.data) {
      cxSelect.start.apply(theSelect);

    // 璁剧疆鑷畾涔夋暟鎹�
    } else if ($.isArray(theSelect.settings.data)) {
      cxSelect.start.call(theSelect, theSelect.settings.data);

    // 璁剧疆 URL锛岄€氳繃 Ajax 鑾峰彇鏁版嵁
    } else if (typeof theSelect.settings.url === 'string' && theSelect.settings.url.length) {
      $.getJSON(theSelect.settings.url, function(json) {
        cxSelect.start.call(theSelect, json);
      });
    };
  };

  // 璁剧疆鍙傛暟
  cxSelect.setOptions = function(opts) {
    var self = this;

    if (opts) {
      $.extend(self.settings, opts);
    };

    // 鍒濇鎴栭噸璁鹃€夋嫨鍣ㄧ粍
    if (!$.isArray(self.selectArray) || !self.selectArray.length || (opts && opts.selects)) {
      self.selectArray = [];

      if ($.isArray(self.settings.selects) && self.settings.selects.length) {
        var _tempSelect;

        for (var i = 0, l = self.settings.selects.length; i < l; i++) {
          _tempSelect = self.dom.box.find('select.' + self.settings.selects[i]);

          if (!_tempSelect || !_tempSelect.length) {break};

          self.selectArray.push(_tempSelect);
        };
      };
    };

    if (opts) {
      if (!$.isArray(opts.data) && typeof opts.url === 'string' && opts.url.length) {
        $.getJSON(self.settings.url, function(json) {
          cxSelect.start.call(self, json);
        });

      } else {
        cxSelect.start.call(self, opts.data);
      };
    };
  };

  // 缁戝畾
  cxSelect.attach = function() {
    var self = this;

    if (!self.attachStatus) {
      self.dom.box.on('change', 'select', self.changeEvent);
    };

    if (typeof self.attachStatus === 'boolean') {
      cxSelect.start.call(self);
    };

    self.attachStatus = true;
  };

  // 绉婚櫎缁戝畾
  cxSelect.detach = function() {
    var self = this;
    self.dom.box.off('change', 'select', self.changeEvent);
    self.attachStatus = false;
  };

  // 娓呯┖閫夐」
  cxSelect.clear = function(index) {
    var self = this;
    var _style = {
      display: '',
      visibility: ''
    };

    index = isNaN(index) ? 0 : index;

    // 娓呯┖鍚庨潰鐨� select
    for (var i = index, l = self.selectArray.length; i < l; i++) {
      self.selectArray[i].empty().prop('disabled', true);

      if (self.settings.emptyStyle === 'none') {
        _style.display = 'none';
      } else if (self.settings.emptyStyle === 'hidden') {
        _style.visibility = 'hidden';
      };

      self.selectArray[i].css(_style);
    };
  };

  cxSelect.start = function(data) {
    var self = this;

    if ($.isArray(data)) {
      self.settings.data = cxSelect.getData(data, self.settings.jsonSpace);
    };

    if (!self.selectArray.length) {return};

    // 淇濆瓨榛樿鍊�
    for (var i = 0, l = self.selectArray.length; i < l; i++) {
      if (typeof self.selectArray[i].attr('data-value') !== 'string' && self.selectArray[i][0].options.length) {
        self.selectArray[i].attr('data-value', self.selectArray[i].val());
      };
    };

    if (self.settings.data || (typeof self.selectArray[0].data('url') === 'string' && self.selectArray[0].data('url').length)) {
      cxSelect.getOptionData.call(self, 0);
    } else if (self.selectArray[0][0].options.length && typeof self.selectArray[0].attr('data-value') === 'string' && self.selectArray[0].data('data-value').length) {
      self.selectArray[0].val(self.selectArray[0].attr('data-value'));
      cxSelect.getOptionData.call(self, 1);
    } else {
      self.selectArray[0].prop('disabled', false).css({
        'display': '',
        'visibility': ''
      });
    };
  };

  // 鑾峰彇閫夐」鏁版嵁
  cxSelect.getOptionData = function(index) {
    var self = this;

    if (typeof index !== 'number' || isNaN(index) || index < 0 || index >= self.selectArray.length) {return};

    var _indexPrev = index - 1;
    var _select = self.selectArray[index];
    var _selectData;
    var _valueIndex;
    var _dataUrl = _select.data('url');
    var _jsonSpace = typeof _select.data('jsonSpace') === 'undefined' ? self.settings.jsonSpace : _select.data('jsonSpace');
    var _query = {};
    var _queryName;
    var _selectName;
    var _selectValue;

    cxSelect.clear.call(self, index);

    // 浣跨敤鐙珛鎺ュ彛
    if (typeof _dataUrl === 'string' && _dataUrl.length) {
      if (index > 0) {
        for (var i = 0, j = 1; i < index; i++, j++) {
          _queryName = self.selectArray[j].data('queryName');
          _selectName = self.selectArray[i].attr('name');
          _selectValue = self.selectArray[i].val();

          if (typeof _queryName === 'string' && _queryName.length) {
            _query[_queryName] = _selectValue;
          } else if (typeof _selectName === 'string' && _selectName.length) {
            _query[_selectName] = _selectValue;
          };
        };
      };

      $.getJSON(_dataUrl, _query, function(json) {
        _selectData = cxSelect.getData(json, _jsonSpace);

        cxSelect.buildOption.call(self, index, _selectData);
      });

    // 浣跨敤鏁村悎鏁版嵁
    } else if (self.settings.data && typeof self.settings.data === 'object') {
      _selectData = self.settings.data;

      for (var i = 0; i < index; i++) {
        _valueIndex = cxSelect.getIndex(self.selectArray[i][0].selectedIndex, typeof self.selectArray[i].data('required') === 'boolean' ? self.selectArray[i].data('required') : self.settings.required);

        if (typeof _selectData[_valueIndex] === 'object' && $.isArray(_selectData[_valueIndex][self.settings.jsonSub]) && _selectData[_valueIndex][self.settings.jsonSub].length) {
          _selectData = _selectData[_valueIndex][self.settings.jsonSub];
        } else {
          _selectData = null;
          break;
        };
      };

      cxSelect.buildOption.call(self, index, _selectData);
    };
  };

  // 鏋勫缓閫夐」鍒楄〃
  cxSelect.buildOption = function(index, data) {
    var self = this;

    var _select = self.selectArray[index];
    var _required = typeof _select.data('required') === 'boolean' ? _select.data('required') : self.settings.required;
    var _firstTitle = typeof _select.data('firstTitle') === 'undefined' ? self.settings.firstTitle : _select.data('firstTitle');
    var _firstValue = typeof _select.data('firstValue') === 'undefined' ? self.settings.firstValue : _select.data('firstValue');
    var _jsonName = typeof _select.data('jsonName') === 'undefined' ? self.settings.jsonName : _select.data('jsonName');
    var _jsonValue = typeof _select.data('jsonValue') === 'undefined' ? self.settings.jsonValue : _select.data('jsonValue');

    if (!$.isArray(data)) {return};

    var _html = !_required ? '<option value="' + String(_firstValue) + '">' + String(_firstTitle) + '</option>' : '';

    // 鍖哄垎鏍囬銆佸€肩殑鏁版嵁
    if (typeof _jsonName === 'string' && _jsonName.length) {
      // 鏃犲€煎瓧娈垫椂浣跨敤鏍囬浣滀负鍊�
      if (typeof _jsonValue !== 'string' || !_jsonValue.length) {
        _jsonValue = _jsonName;
      };

      for (var i = 0, l = data.length; i < l; i++) {
        _html += '<option value="' + String(data[i][_jsonValue]) + '">' + String(data[i][_jsonName]) + '</option>';
      };

    // 鏁扮粍鍗充负鍊肩殑鏁版嵁
    } else {
      for (var i = 0, l = data.length; i < l; i++) {
        _html += '<option value="' + String(data[i]) + '">' + String(data[i]) + '</option>';
      };
    };

    _select.html(_html).prop('disabled', false).css({
      'display': '',
      'visibility': ''
    });

    // 鍒濇鍔犺浇璁剧疆榛樿鍊�
    if (typeof _select.attr('data-value') === 'string') {
      _select.val(String(_select.attr('data-value'))).removeAttr('data-value');

      if (_select[0].selectedIndex < 0) {
        _select[0].options[0].selected = true;
      };
    };

    if (_required || _select[0].selectedIndex > 0) {
      _select.trigger('change');
    };

  };

  // 鏀瑰彉閫夋嫨鏃剁殑澶勭悊
  cxSelect.selectChange = function(name) {
    var self = this;

    if (typeof name !== 'string' || !name.length) {return};

    var index;

    name = name.replace(/\s+/g, ',');
    name = ',' + name + ',';

    // 鑾峰彇褰撳墠 select 浣嶇疆
    for (var i = 0, l = self.selectArray.length; i < l; i++) {
      if (name.indexOf(',' + self.settings.selects[i] + ',') > -1) {
        index = i;
        break;
      };
    };

    if (typeof index === 'number' && index > -1) {
      index += 1;
      cxSelect.getOptionData.call(self, index);
    };
  };

  $.cxSelect = function() {
    return cxSelect.apply(this, arguments);
  };

  // 榛樿鍊�
  $.cxSelect.defaults = {
    selects: [],            // 涓嬫媺閫夋缁�
    url: null,              // 鍒楄〃鏁版嵁鏂囦欢璺緞锛圲RL锛夋垨鏁扮粍鏁版嵁
    data: null,             // 鑷畾涔夋暟鎹�
    emptyStyle: null,       // 鏃犳暟鎹姸鎬佹樉绀烘柟寮�
    required: false,        // 鏄惁涓哄繀閫�
    firstTitle: '璇烽€夋嫨',    // 绗竴涓€夐」鐨勬爣棰�
    firstValue: '',         // 绗竴涓€夐」鐨勫€�
    jsonSpace: '',          // 鏁版嵁鍛藉悕绌洪棿
    jsonName: 'n',          // 鏁版嵁鏍囬瀛楁鍚嶇О
    jsonValue: '',          // 鏁版嵁鍊煎瓧娈靛悕绉�
    jsonSub: 's'            // 瀛愰泦鏁版嵁瀛楁鍚嶇О
  };

  $.fn.cxSelect = function(settings, callback) {
    this.each(function(i) {
      $.cxSelect(this, settings, callback);
    });
    return this;
  };
}));