" JM .vimrc
"------------------------------------------------------------------------------
" PREFERENCES
"------------------------------------------------------------------------------
" Allows multiple lines to be pasted correctly
"vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

"------------------------------------------------------------------------------
" VARIABLE SETTINGS
"------------------------------------------------------------------------------

"set complete=k
"autocmd Syntax * exec('set dict=/usr/share/vim/syntax/' .expand('<amatch>') .'.vim')
"autocmd Syntax * exec('set dict=/home/jmo/test.txt')
"set dict=/home/jmo/test.txt

" status line
  if has('statusline')
    " always show a status line
    set laststatus=2
    set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
  endif

" a ruler on steroids
  set ruler
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)

  if has('gui_running') 
    " full screen
      "set fuoptions=maxvert,maxhorz
      "au GUIEnter * set fullscreen

    " font settings
    :colo molokai

    " misc
      " remove the toolbar and scrollbars
        set guioptions-=Tlr 
        set go-=T
        set transp=8
        set lines=700
        set columns=130

    if has("mac")
      "set guifont=Inconsolata:h14
      "set guifont=Deja\ Vu\ Sans\ Mono:h14
      set guifont=Consolas:h13
    elseif has("unix")
      "set guifont=Monospace\ 9
      set guifont=Liberation\ Mono\ 9 bold
    elseif has("win32") || has("win64")
      set guifont=Consolas:h10:cANSI
    endif

    set cursorline

  endif

" Tag List Options
  "let Tlist_Use_Right_Window=1
  "let Tlist_Use_Horiz_Window=0
  "let Tlist_Compact_Format=1
  "let Tlist_File_Fold_Auto_Close=1
  "let Tlist_Enable_Fold_Column=0
  "let Tlist_WinWidth=50


" Make UP and DOWN keys scroll whole page
  nnoremap <DOWN> 1<C-E>j
  nnoremap <UP> 1<C-Y>k

" Search options
  set ignorecase " case-insensitive
  set incsearch " see results as you type
  "set hlsearch " highlight results

" NERD Tree Options
  let NERDTreeShowHidden=0

" Misc Settings
  "set t_Co=256
  set backspace=indent,eol,start
  set sidescrolloff=10
  set nobackup
  set noswapfile
  "set fdm=marker
  set history=50
  set nocompatible
  "set foldenable
  "set foldclose=all
  set nowrap
  set number
  set ruler
  set showcmd
  set showmatch
  set autoindent
  set softtabstop=2
  set expandtab
  set tabstop=2
  set shiftwidth=2
  set undolevels=500
  set showtabline=18
  set showmode
  set noerrorbells " no beeps, please
  set visualbell
  set listchars=extends:…,tab:\ \ ,trail:⌫
  :filetype plugin on
  :syntax on


"------------------------------------------------------------------------------
" KEY MAPPINGS
"------------------------------------------------------------------------------

  " Select tabs with command+#, just like in iTerm, Firefox, Chrome, etc. <3 -- Thanks, Richtaur!
    map <D-1> 1gt
    map <D-2> 2gt
    map <D-3> 3gt
    map <D-4> 4gt
    map <D-5> 5gt
    map <D-6> 6gt
    map <D-7> 7gt
    map <D-8> 8gt
    map <D-9> 9gt

  " Symfony Keys
    map ,scc :!./symfony cc<CR>
    map ,sbar :!./symfony doctrine:build --all --and-load<CR>

  " Various shortcuts for working with tabs
    map ,t :tabnew  
    map ,d :tabprev<CR> 
    map ,f :tabnext<CR>
    map <D-]> :tabnext<CR>
    map <D-[> :tabprev<CR>

  " Buffers!
    map ,bp :bprev!<CR>
    map ,bn :bnext!<CR>
    "map ,d :MBEbp<CR> 
    "map ,f :MBEbn<CR>

  " Edit our .vimrc file
    map ,vimrc :tabnew ~/.vimrc<CR><CR>

  " NERD Tree, son!
    map	,<TAB>r :NERDTreeMirror<CR>
    map	,<TAB>e :NERDTreeToggle<CR>
    map	,<TAB><SPACE> :o .<CR>

  " working on this
  "  map <silent>xy mk<CR>:silent<CR>yy'k

  " Let's use jj as an alternative to the ESC key
    inoremap jj <Esc>
    nnoremap JJJJ <Nop>

  " Nobody likes typing about :set nu and :set nonu to toggle line numbers
    map ,# :set nu<CR>
    map ,## :set nonu<CR>

  " Same goes for :set wrap and set nowrap
    map ,w :set wrap<CR>
    map ,ww :set nowrap<CR>

  " Set Paste/NoPaste.
    map ,pa :set paste<CR>
    map ,npa :set nopaste<CR>

  " Boy, typing :w sure is a pain!
    map ; :w<CR>
    map <D-s> :w

  " Need a new line? BR below...
    map brb o<ESC>k

  " BR above...
    map bra O<ESC>j

  " Search and replace.
    map ,sr :%s/

  " CTRL + X will close a buffer.
    map <C-x> :bd<CR>

  " g + direction for window split change
    map g <C-w>

  " fuzzy finder
    "map ,f :FufFile<CR>

  " Set TAB to allow for auto-completion (note: this RULES)
    fun! InsertTabWrapper()
        let col = col('.') - 1
        if !col || getline('.')[col - 1] !~ '\k'
           return "\<tab>"
        else
           return "\<c-p>"
        endif
    endfun

    fun! ShiftInsertTabWrapper()
        let col = col('.') - 1
        if !col || getline('.')[col - 1] !~ '\k'
           return "\<s-tab>"
        else
           return "\<c-n>"
        endif
    endfun

    inoremap <tab> <c-r>=InsertTabWrapper()<CR>
    inoremap <s-tab> <c-r>=ShiftInsertTabWrapper()<CR>

  " to beta!
    map ,beta :!./symfony project:deploy beta -t --go<CR>


"------------------------------------------------------------------------------
" PROGRAMMER SHORTCUTS
"------------------------------------------------------------------------------

  " XHTML Wrappers
    :vmap sem    "zdi<em><C-R>z</em><ESC>
    :vmap sli    "zdi<li><C-R>z</li><ESC>
    :vmap sform  "zdi<form><C-R>z</form><ESC>
    :vmap sst    "zdi<strong><C-R>z</strong><ESC>
    :vmap sp     "zdi<p><C-R>z</p><ESC>
    :vmap sdiv   "zdi<div><C-R>z</div><ESC>
    :vmap span   "zdi<span><C-R>z</span><ESC>

  " SVN
    map ,com :!svn commit <C-R>=expand("%")<CR><CR>
    map ,lock :!svn lock <C-R>=expand("%")<CR><CR>
    map ,up :!svn update <C-R>=expand("%")<CR><CR>
    map ,add :!svn add <C-R>=expand("%")<CR><CR>

  " PHP
    map ,ptag i<?php<RETURN><RETURN>
    inoremap ,ptag <?php<RETURN><RETURN>
    inoremap ,pif if ()<RETURN>{<RETURN><TAB>//code<RETURN><BACKSPACE>}<ESC><ESC>3kf(a
    inoremap ,pife if ()<RETURN>{<RETURN><TAB>//code<RETURN><BACKSPACE>}<RETURN>else<RETURN>{<RETURN><TAB>//code...<RETURN><BACKSPACE>}<ESC><ESC>7kf(a
    inoremap ,pwh while ()<RETURN>{<RETURN><TAB>//code<RETURN><BACKSPACE>}<ESC>3kf(a
    inoremap ,pfe foreach ($array as $key => $val)<RETURN>{<RETURN><TAB>//code<RETURN><BACKSPACE>}<ESC>3kf(a
    inoremap ,pfo for ($i = 0; $i < 0; $i++)<RETURN>{<RETURN><TAB>//code<RETURN><BACKSPACE>}<ESC>3kf(a
    inoremap ,psw switch () {<TAB><ESC>o}<ESC>k_f(a
    inoremap ,pca case '':<CR>break;<ESC>k_f"a
    inoremap ,pde default:<CR>break;<ESC>k_f:a
    inoremap ,psw switch () {<RETURN><RETURN>}<ESC>2k_f(a
    inoremap ,pia if (isset($_REQUEST['action'])){<ESC>o<TAB>switch($_REQUEST['action']) {<ESC>o<TAB>case:<ESC>obreak;<ESC>o<RETURN>default:<ESC>obreak;<ESC>o<ESC>i<TAB>}<ESC>o<ESC>i}<ESC>6kf'a
    inoremap ,pwf while ($row = mysql_fetch_assoc($query)) {<ESC>o}<ESC>kf{o<TAB>
    inoremap ,pqu $query = '<ESC>o';<ESC>kf'o<TAB>
    inoremap ,psq $query = mysql_query($query) or die(mysql_error());<ESC>
    inoremap ,pqq $query = '<RETURN><TAB>SELECT *<RETURN>FROM table<RETURN><BACKSPACE>';<RETURN><RETURN>$query = mysql_query($query) or die(mysql_error());<RETURN><RETURN>while($row = mysql_fetch_assoc($query))<RETURN>{<RETURN><TAB>$rtn[] = $row;<RETURN><BACKSPACE>}<ESC>7kf<SPACE>l
    inoremap ,pts date('Y-m-d H:i:s');<ESC>o<ESC>
    inoremap ,ppo $_POST['']<ESC>F'i
    inoremap ,pre $_REQUEST['']<ESC>F'i
    inoremap ,pge $_GET['']<ESC>F'i
    inoremap ,pip $_SERVER["REMOTE_ADDR"]
    inoremap ,ppr print_r();<ESC>2ha
    inoremap ,vdd var_dump(); die;<ESC>8hi
    inoremap ,vd var_dump();<ESC>2ha
    inoremap ,di var_dump();<ESC>2ha
    inoremap ,prq require();<ESC>2ha
    inoremap ,pfu function () {<RETURN><RETURN>}<ESC>2k_f(i
    inoremap ,pdoc /**<RETURN>*<RETURN>*<RETURN>* @package _<RETURN>* @subpackage<RETURN>* @author Joshua Morse <joshua.morse@iostudio.com><RETURN>*<RETURN>*/<ESC>6ka

  " HTML Shortcuts
    inoremap ,hul <ul><RETURN><TAB><li></li><RETURN><BACKSPACE></ul><ESC>k_f>a
    inoremap ,hol <ol><RETURN><TAB><li></li><RETURN><BACKSPACE></ol><ESC>k_f>a
    inoremap ,hli <li></li><ESC>F>a
    inoremap ,hpp <p></p><ESC>F>a
    inoremap ,hdv <div></div><ESC>F>a
    inoremap ,hse <select name=""><RETURN><RETURN></select><ESC>2kf"a
    inoremap ,hop <option value=""></option><ESC>F"i
    inoremap ,hem <em></em><ESC>F>a
    inoremap ,hsr <strong></strong><ESC>F>a
    inoremap ,hbr <br/>
    inoremap ,hfo <form action="" id=""></form><ESC>F"i
    inoremap ,hti <title></title><ESC>F>a
    inoremap ,hpr <pre></pre><ESC>F>a
    inoremap ,the <textarea></textarea><ESC>F>a
    inoremap ,hst <style type="text/css"><RETURN><RETURN></style><ESC>ki
    inoremap ,hsc <script type="text/javascript"><RETURN><RETURN></script><ESC>ki<TAB>
    inoremap ,hin <input type="" value="" name="" />

  " Javascript
    inoremap ,jif if()<RETURN>{<ESC>o}<ESC>2kf(a
    inoremap ,jwh while()<RETURN>{<ESC>o}<ESC>kI<ESC>kf(a
    inoremap ,jfo for(i; i < 10; i++)<RETURN>{<ESC>o}<ESC>2kfi
    inoremap ,jfi for(var in ob)<RETURN>{<ESC>o}<ESC>kI<ESC>fv
    inoremap ,jtc try()<RETURN>{<RETURN><RETURN>}<ESC>2k_f(a

  " CSS
    inoremap ,cbo border: 1px solid black;
    inoremap ,cdn display: none;
    inoremap ,cwi width:;<ESC>ha<SPACE>
    inoremap ,che height:;<ESC>ha<SPACE>
    inoremap ,cfl float:;<ESC>ha<SPACE>
    inoremap ,cpa padding:;<ESC>ha<SPACE>
    inoremap ,ccl clear:;<ESC>ha<SPACE>
    inoremap ,cba background:;<ESC>ha<SPACE>
    inoremap ,cbp background-position:;<ESC>ha<SPACE>
    inoremap ,cfo font:;<ESC>ha<SPACE>

"------------------------------------------------------------------------------
" SEMANTAC CORRECTION
"------------------------------------------------------------------------------
abbreviate ehco echo
abbreviate qeury query
abbreviate pritn print
abbreviate GLBOASL GLOBALS
abbreviate GLBOALS GLOBALS
abbreviate GLoBALS GLOBALS
abbreviate teh the
abbreviate strDtat strData
abbreviate accesories accessories
abbreviate accomodate accommodate
abbreviate acheive achieve
abbreviate acheiving achieving
abbreviate acn can
abbreviate acommodate accommodate
abbreviate acomodate accommodate
abbreviate acommodated accommodated
abbreviate acomodated accommodated
abbreviate adn and
abbreviate agian again
abbreviate ahppen happen
abbreviate ahve have
abbreviate ahve have
abbreviate allready already
abbreviate almsot almost
abbreviate alos also
abbreviate alot a lot
abbreviate alreayd already
abbreviate alwasy always
abbreviate amke make
abbreviate anbd and
abbreviate andthe and the
abbreviate appeares appears
abbreviate aplyed applied
abbreviate artical article
abbreviate aslo also
abbreviate audeince audience
abbreviate audiance audience
abbreviate awya away
abbreviate bakc back
abbreviate balence balance
abbreviate baout about
abbreviate bcak back
abbreviate beacuse because
abbreviate becasue because
abbreviate becomeing becoming
abbreviate becuase because
abbreviate becuse because
abbreviate befoer before
abbreviate begining beginning
abbreviate beleive believe
abbreviate bianry binary
abbreviate bianries binaries
abbreviate boxs boxes
abbreviate bve be
abbreviate changeing changing
abbreviate charachter character
abbreviate charcter character
abbreviate charcters characters
abbreviate charecter character
abbreviate charector character
abbreviate cheif chief
abbreviate circut circuit
abbreviate claer clear
abbreviate claerly clearly
abbreviate cna can
abbreviate colection collection
abbreviate comany company
abbreviate comapny company
abbreviate comittee committee
abbreviate commitee committee
abbreviate committe committee
abbreviate committy committee
abbreviate compair compare
abbreviate compleated completed
abbreviate completly completely
abbreviate comunicate communicate
abbreviate comunity community
abbreviate conected connected
abbreviate cotten cotton
abbreviate coudl could
abbreviate cpoy copy
abbreviate cxan can
abbreviate danceing dancing
abbreviate definately definitely
abbreviate develope develop
abbreviate developement development
abbreviate differant different
abbreviate differnt different
abbreviate diffrent different
abbreviate disatisfied dissatisfied
abbreviate doese does
abbreviate doign doing
abbreviate doller dollars
abbreviate donig doing
abbreviate driveing driving
abbreviate drnik drink
abbreviate ehr her
abbreviate embarass embarrass
abbreviate equippment equipment
abbreviate esle else
abbreviate excitment excitement
abbreviate exmaple example
abbreviate exmaples examples
abbreviate eyt yet
abbreviate familar familiar
abbreviate feild field
abbreviate fianlly finally
abbreviate fidn find
abbreviate firts first
abbreviate follwo follow
abbreviate follwoing following
abbreviate foriegn foreign
abbreviate fro for
abbreviate foudn found
abbreviate foward forward
abbreviate freind friend
abbreviate frmo from
abbreviate fwe few
abbreviate gerat great
abbreviate geting getting
abbreviate giveing giving
abbreviate goign going
abbreviate gonig going
abbreviate govenment government
abbreviate gruop group
abbreviate grwo grow
abbreviate haev have
abbreviate happend happened
abbreviate haveing having
abbreviate hda had
abbreviate helpfull helpful
abbreviate herat heart
abbreviate hge he
abbreviate hismelf himself
abbreviate hsa has
abbreviate hsi his
abbreviate hte the
abbreviate htere there
abbreviate htey they
abbreviate hting thing
abbreviate htink think
abbreviate htis this
abbreviate hvae have
abbreviate hvaing having
abbreviate idae idea
abbreviate idaes ideas
abbreviate ihs his
abbreviate immediatly immediately
abbreviate indecate indicate
abbreviate insted intead
abbreviate inthe in the
abbreviate iwll will
abbreviate iwth with
abbreviate jsut just
abbreviate knwo know
abbreviate knwos knows
abbreviate konw know
abbreviate konws knows
abbreviate levle level
abbreviate libary library
abbreviate librarry library
abbreviate librery library
abbreviate librarry library
abbreviate liek like
abbreviate liekd liked
abbreviate liev live
abbreviate likly likely
abbreviate littel little
abbreviate liuke like
abbreviate liveing living
abbreviate loev love
abbreviate lonly lonely
abbreviate makeing making
abbreviate mkae make
abbreviate mkaes makes
abbreviate mkaing making
abbreviate moeny money
abbreviate mroe more
abbreviate mysefl myself
abbreviate myu my
abbreviate neccessary necessary
abbreviate necesary necessary
abbreviate nkow know
abbreviate nwe new
abbreviate nwo now
abbreviate ocasion occasion
abbreviate occassion occasion
abbreviate occurence occurrence
abbreviate occurrance occurrence
abbreviate ocur occur
abbreviate oging going
abbreviate ohter other
abbreviate omre more
abbreviate onyl only
abbreviate optoin option
abbreviate optoins options
abbreviate opperation operation
abbreviate orginized organized
abbreviate otehr other
abbreviate otu out
abbreviate owrk work
abbreviate peopel people
abbreviate perhasp perhaps
abbreviate perhpas perhaps
abbreviate pleasent pleasant
abbreviate poeple people
abbreviate porblem problem
abbreviate preceed precede
abbreviate preceeded preceded
abbreviate probelm problem
abbreviate protoge protege
abbreviate puting putting
abbreviate pwoer power
abbreviate quater quarter
abbreviate questoin question
abbreviate reccomend recommend
abbreviate reccommend recommend
abbreviate receieve receive
abbreviate recieve receive
abbreviate recieved received
abbreviate recomend recommend
abbreviate reconize recognize
abbreviate recrod record
abbreviate religous religious
abbreviate rwite write
abbreviate rythm rhythm
abbreviate selectoin selection
abbreviate sentance sentence
abbreviate seperate separate
abbreviate shineing shining
abbreviate shiped shipped
abbreviate shoudl should
abbreviate similiar similar
abbreviate smae same
abbreviate smoe some
abbreviate soem some
abbreviate sohw show
abbreviate soudn sound
abbreviate soudns sounds
abbreviate statment statement
abbreviate stnad stand
abbreviate stopry story
abbreviate stoyr story
abbreviate stpo stop
abbreviate strentgh strength
abbreviate struggel struggle
abbreviate sucess success
abbreviate swiming swimming
abbreviate tahn than
abbreviate taht that
abbreviate talekd talked
abbreviate tath that
abbreviate teh the
abbreviate tehy they
abbreviate tghe the
abbreviate thansk thanks
abbreviate themselfs themselves
abbreviate theri their
abbreviate thgat that
abbreviate thge the
abbreviate thier their
abbreviate thme them
abbreviate thna than
abbreviate thne then
abbreviate thnig thing
abbreviate thnigs things
abbreviate thsi this
abbreviate thsoe those
abbreviate thta that
abbreviate tihs this
abbreviate timne time
abbreviate tje the
abbreviate tjhe the
abbreviate tkae take
abbreviate tkaes takes
abbreviate tkaing taking
abbreviate tlaking talking
abbreviate todya today
abbreviate tongiht tonight
abbreviate tonihgt tonight
abbreviate towrad toward
abbreviate tpyo typo
abbreviate truely truly
abbreviate tyhat that
abbreviate tyhe the
abbreviate useing using
abbreviate veyr very
abbreviate vrey very
abbreviate waht what
abbreviate watn want
abbreviate wehn when
abbreviate whcih which
abbreviate whic which
abbreviate whihc which
abbreviate whta what
abbreviate wief wife
abbreviate wierd weird
abbreviate wihch which
abbreviate wiht with
abbreviate windoes windows
abbreviate withe with
abbreviate wiull will
abbreviate wnat want
abbreviate wnated wanted
abbreviate wnats wants
abbreviate woh who
abbreviate wohle whole
abbreviate wokr work
abbreviate woudl would
abbreviate wriet write
abbreviate wrod word
abbreviate wroking working
abbreviate wtih with
abbreviate wya way
abbreviate yera year
abbreviate yeras years
abbreviate ytou you
abbreviate yuo you
abbreviate yuor your
abbreviate yoru your
abbreviate sunday Sunday
abbreviate monday Monday
abbreviate tuesday Tuesday
abbreviate wednesday Wednesday
abbreviate thursday Thursday
abbreviate friday Friday
abbreviate saturday Saturday