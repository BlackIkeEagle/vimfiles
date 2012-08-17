" Vim syntax file
" Language:    JavaScript
" Maintainer:  David W Davis <xantus@xantus.org> http://xant.us/
" URL:           http://xant.us/extjs/javascript.vim
" Updated 2009 Jul 23
" put this file in ~/.vim/syntax/


" Based on the JavaScript vim syntax maintained by
" Claudio Fleiner <claudio@fleiner.com>
" http://www.fleiner.com/vim/syntax/javascript.vim
" Modified for Extjs v3, http://extjs.com/
" By David W Davis, contact David not Claudio
" about THIS syntax definition!


" tuning parameters:
" unlet javaScript_fold

if !exists('main_syntax')
  if version < 600
    syntax clear
  elseif exists('b:current_syntax')
    finish
  endif
  let main_syntax = 'javascript'
endif

if version < 600 && exists('javaScript_fold')
  unlet javaScript_fold
endif

"syn case ignore


syn match javaScriptExtjsMethod         "\w\+\s*\:\s*function"
syn match javaScriptSpecialFn           "console\.log\|Ext\.log"
syn match javaScriptExtjsCore           "Ext\.\(BLANK_IMAGE_URL\|SSL_SECURE_URL\|USE_NATIVE_JSON\|chromeVersion\|enableFx\|enableGarbageCollector\|enableListenerCollection\|enableNestedListenerRemoval\|enumerables\|firefoxVersion\|ieVersion\|isChrome\|isFF3_0\|isFF3_5isFF3_6\|isFF4\|isFF5\|isGecko\|isGecko3\|isGecko4\|isGecko5\|isIE\|isIE6\|isIE7\|isIE8\|isIE9\|isLinux\|isMac\|isOpera\|isOpera10_5\|isReady\|isSafari\|isSafari2\|isSafari3\|isSafari4\|isSafari5\|isWebKit\|isWindows\|log\|operaVersion\|safariVersion\|scopeResetCSS\|useShims\|webKitVersion\|addBehaviors\|application\|apply\|applyIf\|bind\|callback\|clone\|copyTo\|create\|createByAlias\|decode\|defer\|define\|destroy\|destroyMembers\|each\|emptyFn\|encode\|exclude\|fly\|get\|getBody\|getClass\|getClassName\|getCmp\|getDoc\|getDom\|getHead\|getOrientation\|getScrollbarSize\|getStore\|htmlDecode\|htmlEncode\|id\|isArray\|isBoolean\|isDate\|isDefined\|isElement\|isEmpty\|isFunction\|isIterable\|isNumber\|isNumeric\|isObject\|isPrimitive\|isString\|isTextNode\|iterate\|merge\|namespace\|ns\|onDocumentReady\|onReady\|override\|pass\|preg\|query\|regStore\|removeNode\|require\|select\|syncRequire\|toArray\|typeOf\|urlAppend\|valueFrom\|widget\|\)"
syn match javaScriptExtjsClass          "Ext\.\(AbstractComponent\|AbstractManager\|AbstractPlugin\|Action\|Ajax\|Array\|Base\|Class\|ClassManager\|Component\|ComponentLoader\|ComponentManager\|ComponentQuery\|CompositeElement\|CompositeElementLite\|DomHelper\|DomQuery\|Editor\|Element\|ElementLoader\|EventManager\|EventObject\|FocusManager\|Function\|Img\|is\|JSON\|Layer\|Loader\|LoadMask\|MessageBox\|ModelManager\|Number\|Object\|PluginManager\|ProgressBar\|Shadow\|String\|supports\|TaskManager\|Template\|Version\|WindowManager\|XTemplate\|ZIndexManager\|app.Application\|app.Controller\|button.Button\|button.Cycle\|button.Split\|chart.axis.Abstract\|chart.axis.Axis\|chart.axis.Category\|chart.axis.Gauge\|chart.axis.Numeric\|chart.axis.Time\|chart.series.Area\|chart.series.Bar\|chart.series.Cartesian\|chart.series.Column\|chart.series.Gauge\|chart.series.Line\|chart.series.Pie\|chart.series.Radar\|chart.series.Scatter\|chart.series.Series\|chart.theme.Theme\|chart.Callout\|chart.Chart\|chart.Highlight\|chart.Label\|chart.Legend\|chart.LegendItem\|chart.Mask\|chart.Navigation\|chart.Tip\|container.AbstractContainer\|container.ButtonGroup\|container.Container\|container.Viewport\|data.proxy.Ajax\|data.proxy.Client\|data.proxy.Direct\|data.proxy.JsonP\|data.proxy.LocalStorage\|data.proxy.Memory\|data.proxy.Proxy\|data.proxy.Rest\|data.proxy.Server\|data.proxy.SessionStorage\|data.proxy.WebStorage\|data.reader.Array\|data.reader.Json\|data.reader.Reader\|data.reader.Xml\|data.writer.Json\|data.writer.Writer\|data.writer.Xml\|data.AbstractStore\|data.ArrayStore\|data.Association\|data.Batch\|data.BelongsToAssociation\|data.Connection\|data.DirectStore\|data.Errors\|data.Field\|data.HasManyAssociation\|data.JsonP\|data.Model\|data.NodeInterface\|data.Operation\|data.Request\|data.ResultSet\|data.SortTypes\|data.Store\|data.StoreManager\|data.Tree\|data.TreeStore\|data.Types\|data.validations\|dd.DD\|dd.DDProxy\|dd.DDTarget\|dd.DragDrop\|dd.DragDropManager\|dd.DragSource\|dd.DragTracker\|dd.DragZone\|dd.DropTarget\|dd.DropZone\|dd.Registry\|dd.ScrollManager\|dd.StatusProxy\|direct.Event\|direct.ExceptionEvent\|direct.JsonProvider\|direct.Manager\|direct.PollingProvider\|direct.Provider\|direct.RemotingEvent\|direct.RemotingProvider\|direct.Transaction\|draw.engine.Svg\|draw.engine.Vml\|draw.Color\|draw.Component\|draw.CompositeSprite\|draw.Sprite\|draw.Surface\|env.Browser\|env.FeatureDetector\|env.OS\|flash.Component\|form.action.Action\|form.action.DirectLoad\|form.action.DirectSubmit\|form.action.Load\|form.action.StandardSubmit\|form.action.Submit\|form.field.Base\|form.field.Checkbox\|form.field.ComboBox\|form.field.Date\|form.field.Display\|form.field.Field\|form.field.File\|form.field.Hidden\|form.field.HtmlEditor\|form.field.Number\|form.field.Picker\|form.field.Radio\|form.field.Spinner\|form.field.Text\|form.field.TextArea\|form.field.Time\|form.field.Trigger\|form.field.VTypes\|form.Basic\|form.CheckboxGroup\|form.FieldAncestor\|form.FieldContainer\|form.FieldSet\|form.Label\|form.Labelable\|form.Panel\|form.RadioGroup\|fx.target.Component\|fx.target.CompositeElement\|fx.target.CompositeElementCSS\|fx.target.CompositeSprite\|fx.target.Element\|fx.target.ElementCSS\|fx.target.Sprite\|fx.target.Target\|fx.Anim\|fx.Animator\|fx.Easing\|grid.column.Action\|grid.column.Boolean\|grid.column.Column\|grid.column.Date\|grid.column.Number\|grid.column.Template\|grid.feature.AbstractSummary\|grid.feature.Chunking\|grid.feature.Feature\|grid.feature.Grouping\|grid.feature.GroupingSummary\|grid.feature.RowBody\|grid.feature.Summary\|grid.header.Container\|grid.plugin.CellEditing\|grid.plugin.DragDrop\|grid.plugin.Editing\|grid.plugin.HeaderResizer\|grid.plugin.RowEditing\|grid.property.Grid\|grid.property.HeaderContainer\|grid.property.Property\|grid.property.Store\|grid.PagingScroller\|grid.Panel\|grid.RowNumberer\|grid.Scroller\|grid.View\|layout.container.Absolute\|layout.container.AbstractCard\|layout.container.AbstractContainer\|layout.container.AbstractFit\|layout.container.Accordion\|layout.container.Anchor\|layout.container.Auto\|layout.container.Border\|layout.container.Box\|layout.container.Card\|layout.container.CheckboxGroup\|layout.container.Column\|layout.container.Container\|layout.container.Fit\|layout.container.HBox\|layout.container.Table\|layout.container.VBox\|layout.Layout\|menu.CheckItem\|menu.ColorPicker\|menu.DatePicker\|menu.Item\|menu.Manager\|menu.Menu\|menu.Separator\|panel.AbstractPanel\|panel.Header\|panel.Panel\|panel.Proxy\|panel.Table\|panel.Tool\|picker.Color\|picker.Date\|picker.Time\|resizer.Handle\|resizer.Resizer\|resizer.Splitter\|selection.CellModel\|selection.CheckboxModel\|selection.Model\|selection.RowModel\|slider.Multi\|slider.Single\|slider.Tip\|state.CookieProvider\|state.LocalStorageProvider\|state.Manager\|state.Provider\|state.Stateful\|tab.Bar\|tab.Panel\|tab.Tab\|tip.QuickTip\|tip.QuickTipManager\|tip.Tip\|tip.ToolTip\|toolbar.Fill\|toolbar.Item\|toolbar.Paging\|toolbar.Separator\|toolbar.Spacer\|toolbar.TextItem\|toolbar.Toolbar\|tree.plugin.TreeViewDragDrop\|tree.Panel\|tree.View\|util.AbstractMixedCollection\|util.Animate\|util.ClickRepeater\|util.ComponentDragger\|util.Cookies\|util.CSS\|util.DelayedTask\|util.Filter\|util.Floating\|util.Format\|util.Grouper\|util.HashMap\|util.History\|util.Inflector\|util.KeyMap\|util.KeyNav\|util.Memento\|util.MixedCollection\|util.Observable\|util.Point\|util.Region\|util.Sortable\|util.Sorter\|util.TaskRunner\|util.TextMetrics\|view.AbstractView\|view.BoundList\|view.BoundListKeyNav\|view.Table\|view.TableChunker\|view.View\|window.MessageBox\|window.Window\)"

syn match javaScriptExtjsDateClass      "Ext\.Date\.\(DAY\|HOUR\|MILLI\|MINUTE\|MONTH\|SECOND\|YEAR\|dayNames\|defaultFormat\|defaults\|formatCodes\|formatFunctions\|monthNames\|monthNumbers\|parseFunctions\|useStrict\|add\|between\|clearTime\|clone\|format\|formatContainsDateInfo\|formatContainsHourInfo\|getDayOfYear\|getDaysInMonth\|getElapsed\|getFirstDateOfMonth\|getFirstDayOfMonth\|getGMTOffset\|getLastDateOfMonth\|getLastDayOfMonth\|getMonthNumber\|getShortDayName\|getShortMonthName\|getSuffix\|getTimezone\|getWeekOfYear\|isDST\|isLeapYear\|isValid\|now\|parse\|\)"
syn match javaScriptExtjsMisc           "\.\(bind\|createInterceptor\|createSequence\|defer\|constrain\|capitalize\|ellipsis\|escape\|escapeRegex\|format\|htmlDecode\|htmlEncode\|leftPad\|repeat\|toggle\|trim\|urlAppend\|indexOf\|remove\|between\|clearTime\|clone\|format\|getDayOfYear\|getDaysInMonth\|getElapsed\|getFirstDateOfMonth\|getFirstDayOfMonth\|getGMTOffset\|getLastDateOfMonth\|getLastDayOfMonth\|getMonthNumber\|getShortDayName\|getShortMonthName\|getSuffix\|getTimezone\|getWeekOfYear\|isLeapYear\)"
syn keyword javaScriptCommentKeys       private contained
syn match   javaScriptExtjsDoc          "@\(class\|link\|param\|return\|ignore\|hide\|private\|static\|singleton\|type\|property\|cfg\|extends\|event\)\|{\(Boolean\|String\|Number\|Object\|Array\|Function\|HTMLElement\|Mixed\|Date\)\(\/\(Boolean\|String\|Number\|Object\|Array\|Function\|HTMLElement\|Mixed\|Date\)\)*}\|#\w\+"
syn keyword javaScriptCommentTodo       TODO FIXME XXX TBD contained
syn match   javaScriptLineComment       "//.*" contains=javaScriptCommentTodo,javaScriptExtjsDoc,javaScriptExtjsClass,javaScriptCommentKeys
syn match   javaScriptCommentSkip       "^[ \t]*\*\($\|[ \t]\+\)"
syn region  javaScriptComment           start="/\*"  end="\*/" contains=javaScriptCommentTodo,javaScriptExtjsDoc,javaScriptExtjsClass,javaScriptCommentKeys
syn match   javaScriptSpecial           "\\\d\d\d\|\\." 
syn region  javaScriptStringD           start=+"+  skip=+\\\\\|\\"+  end=+"+  contains=javaScriptSpecial,@htmlPreproc
syn region  javaScriptStringS           start=+'+  skip=+\\\\\|\\'+  end=+'+  contains=javaScriptSpecial,@htmlPreproc
syn match   javaScriptSpecialCharacter  "'\\.'"
syn match   javaScriptNumber            "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
"syn region  javaScriptRegexpString     start=+/+ skip=+\\\\\|\\/+ end=+/[gi]\?\s*$+ end=+/[gi]\?\s*[;,)]+me=e-1 contains=@htmlPreproc oneline
syn keyword javaScriptConditional       if else defined undefined try catch
syn keyword javaScriptRepeat            while for
syn keyword javaScriptBranch            break continue switch case default
syn keyword javaScriptOperator          new in
syn keyword javaScriptType              this var const arguments
syn keyword javaScriptStatement         return with call apply prototype superClass
syn keyword javaScriptBoolean           true false

if exists('javaScript_fold')
    syn match    javaScriptFunction        "\<function\>"
    syn region   javaScriptFunctionFold    start="\<function\>.*[^};]$" end="^\z1}.*$" transparent fold keepend

    syn sync match javaScriptSync          grouphere javaScriptFunctionFold "\<function\>"
    syn sync match javaScriptSync          grouphere NONE "^}"

    setlocal foldmethod=syntax
    setlocal foldtext=getline(v:foldstart)
else
    syn keyword  javaScriptFunction        function alert substr substring prompt input match
    syn match    javaScriptBraces          "[{}]"
endif

syn sync fromstart
syn sync maxlines=100

" catch errors caused by wrong parenthesis
syn region  javaScriptParen             transparent start="(" end=")" contains=javaScriptParen,javaScriptComment,javaScriptLineComment,javaScriptSpecial,javaScriptStringD,javaScriptStringS,javaScriptSpecialCharacter,javaScriptNumber,javaScriptRegexpString,javaScriptConditional,javaScriptBoolean,javaScriptBraces,javaScriptRepeat,javaScriptBranch,javaScriptType,javaScriptExtjsMisc,javaScriptExtjsClass,javaScriptExtjsDateClass,javaScriptExtjsCore,javaScriptSpecialFn,javaScriptFunction,javaScriptExtjsMethod,javaScriptExtjsDoc,javaScriptOperator,javaScriptStatement
syn match   javaScrParenError  ")"

if main_syntax == 'javascript'
  syn sync ccomment javaScriptComment
endif

" Define the default highlighting.
if version >= 508 || !exists('did_javascript_syn_inits')
  if version < 508
    let did_javascript_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink javaScriptComment              Comment
  HiLink javaScriptLineComment          Comment
  HiLink javaScriptCommentKeys          Special
  HiLink javaScriptCommentTodo          Todo
  HiLink javaScriptSpecial              Special
  HiLink javaScriptStringS              String
  HiLink javaScriptStringD              String
  HiLink javaScriptCharacter            Character
  HiLink javaScriptSpecialCharacter     javaScriptSpecial
  HiLink javaScriptNumber               javaScriptValue
  HiLink javaScriptConditional          Conditional
  HiLink javaScriptRepeat               Repeat
  HiLink javaScriptBranch               Conditional
  HiLink javaScriptOperator             Operator
  HiLink javaScriptType                 Type
  HiLink javaScriptStatement            Statement
  HiLink javaScriptFunction             Function
  HiLink javaScriptBraces               Function
  HiLink javaScriptError                Error
  HiLink javaScrParenError              javaScriptError
  HiLink javaScriptBoolean              Boolean
  HiLink javaScriptRegexpString         String
  HiLink javaScriptExtjsMisc            Function
  HiLink javaScriptExtjsClass           Type
  HiLink javaScriptExtjsDateClass       Type
  HiLink javaScriptExtjsCore            Special
  HiLink javaScriptExtjsMethod          Function
  HiLink javaScriptExtjsDoc             Special
  HiLink javaScriptSpecialFn            Special
  delcommand HiLink
endif

let b:current_syntax = 'javascript'
if main_syntax == 'javascript'
  unlet main_syntax
endif

"vim: ts=4

