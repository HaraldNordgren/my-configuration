function shuffle(array) {
  var currentIndex = array.length, temporaryValue, randomIndex;

  while (0 !== currentIndex) {

    randomIndex = Math.floor(Math.random() * currentIndex);
    currentIndex -= 1;

    temporaryValue = array[currentIndex];
    array[currentIndex] = array[randomIndex];
    array[randomIndex] = temporaryValue;
  }

  return array;
}

function anagram_jonte(w1, w2) {
    if (w1.length !== w2.length) return false;
    count = {};
    for (var i = 0; i<w1.length; i++) {
            count[w1[i]] = count[w1[i]] ? count[w1[i]] + 1 : 1;
            count[w2[i]] = count[w2[i]] ? count[w2[i]] - 1 : -1;
    }
    for (var c in count) {
            if (count[c] !== 0) return false; 
    }
    return true;
}

function anagram_harald(w1, w2) {
    if (w1.length !== w2.length) return false;

    a1 = w1.split("").sort()
    a2 = w2.split("").sort()

    for (var i=0; i < a1.length; i++) {
        if (a1[i] !== a2[i]) return false;
    }

    return true;
}

var w = "dpewoioepöfndfjmnfdpoefduewjiofjenfbjksjdfkdö-dfkpfiölehfbkejbfdh,fbdhkf,bdjöfdfbjdfjdkfhdfjkdnfjdkfndjfndflask.fne.kfnejf,ebfjkd,bfnlekjfenkfj.ebfjd.fkj.bfdksaopdksödksdsdhsdsdjspdåwkdjoiehdfuhenfsukhföilfrjiöhlföodökfröoifjlrfioörhlfrufhrfrjnfklkfldskjfdölfkjdflkdjfdlkfjdsfdsdsklfdjfldkfjdfkldsjfkldjeadSDLMKAFDHNFDJKFDUJKLFEFUddijsfihuklfnlekfbjkfljEREFesfsfdsfdshthtsfdfkldsfjdskfhdfulfhefuklhdsulfkasdhfliudskjfhdfeiufhdsfkjdshfjkdsfhdsifelihwguidlkwhjdksilfjdsbfkjfgbvilayfukjdshlfuiblyjdsailfhkdfvhdkfsdifujhdsulfdfgilykhvfbwiakydvebkfjlkhsbfjehkfvbludkhgbenfukehvfbkjelwheiblykw<bhfshkdvb<kjljdhsifukjdfhudfkjbfiefkevhfilefhlbeifhkeepwoeiwpeowiewjopejöhdswuehaeuilawghdoiwaudgwduigwduigduiJIDAOIUDHEDBJDHNIULKDJDHUKWJDHUIAWLKD<J<ODILHWDIUGFBNIFLYKGVDBLAWIUKDJBWLDIYKWAVHDBLIWYDKHVWABDYIWHKDBWYIuhdjidhudyikgduywdkgh<duilkwgbdlyfskhvdbwvy<dvhwbilydkvwdyulwvhkdkgwdjhvbwkdjwvhdk<wjdsfsfhweuqgbygyujfyitgcfvytukcgfvytgjcvFYCGVYTGFGVBTUKGFVYTKUCGJVYCFHCGKYRJVKTCygfytukyfgrtegyhwajoeilqwhewildbusakdjskldhsdjlsdhaslukdjhsdukejbfhdjfbdshfkjbnfehkbjfhn<libdhkfneshbjfmbznrsedbhkjznawlmöoinf<jclbankwdlbfhvk< wnklebvsehk adwnklfadwjfsejk dawnljgrfbejkag<sfhdfrbhekajwnldavbujh ke.wjknldfbh jdkfh jdqbmnbah webmhdfebajwehdkjebhwhjeabwkh h,afj,fjk.drhneb j,hgrjnksnjlhbdf vhkjsknamwnebjkh fkjenalwdjshb gjnksemadwasjknbfkaemwqjnfbnedwdnefbjk sfe,adkanfb sjef,.kjbc .sej,bf<waj,h<fb fbhmjnd<bhefrhzn<diunfbhvjkrle<aiwkpojiöavöcm<iosukjl kke<wmezjöbkvl<noci rhkea<jk.wdnvkc<jkwjxhjcbjh ,heajwkhfbvhksjeanknvbrkjawndkerjvbkh jadwnk.ejvbk <aej.lnkfjvaekw.dfbjhv <hadjwenvrbkhekawjnlejbhrewdmkldfljbdfk.jkljcilnfhjmucnfkjg,hnfkjd,sbfnskdfsnkajfdhbfkhcjlbakrhweabjnkvb k.jeaknfvbkjw,k.fBK. J<W KH.JCNKSR.JESHBDC,JR<EAHSBDHJ,Rskeahebdhmjc,ehanbe,dh,jb<neakb<sdh,bcne<aj,rvbfvk.e<.ajhrgbfjeahrfbj,e<ahsfbahbfjahmbuiklhegrylekgbfuyhklesbhdlikuqhakwdsja<wukdjbglyw<jkldbqa<efhbdeahedbj,awjhd,vwnabz djhawbn<sh,vnqs ghq<bmsvbazfj,hvsnkezj.<dbhcjhzeszhj,dbjch,ejzndsbj c,hsbejzdns<xjcseh,bjzdjh,ebjzfdh,anbs< j,whbjefh<j ,w<jklvnbjeah<jvshbdsvjkach ,srjed cjvh,zjendbs,jcjefb<ejfdh,ekajeiuawhdualk<gd<eyilkrjehfliöwhdgby<lkjdgaebyhfkjehgdbyhekgfb<wlöhdbilekjfaeblhdjlb<adhkjlhkwdbuiqkaklqjhsdukjlenfkjsb,dfnszöldb<enkjd,bsdkelhfdbkeh,jflkjawhubiedkhfbnawawbuidkhvbjnzrseoiawurfljagkrsåeodminljcnsje8942yhgbf98wh038fbysusidhln3iwuiohdnb3yukejbhn128oq3uihfvn9cuekgjhd98nacesjhfnuwoiq3ujer8oiuhj3rnfuh4rfniuw4krhjfnw3iuhgbiukgutjfgu6yikrf76guyiUYTGUYUKTGUTKYHKTGVYTUYRK3WH8EUKR4HJW37IUEUWIO3WF4EFBEUDIJ8ERHBEYDWUKAHSRGVYHUAEIFSFEUHGAEURSBuekhiifsisgwbj3kaiesrgfebhj3kshugew yjashfhyg3vehbjjkefhilzyiegyjbqhsjfixlueg3yjsxfiuhsjfids<F4>ewgydpewoioepöfndfjmnfdpoefduewjiofjenfbjksjdfkdö-dfkpfiölehfbkejbfdh,fbdhkf,bdjöfdfbjdfjdkfhdfjkdnfjdkfndjfndflask.fne.kfnejf,ebfjkd,bfnlekjfenkfj.ebfjd.fkj.bfdksaopdksödksdsdhsdsdjspdåwkdjoiehdfuhenfsukhföilfrjiöhlföodökfröoifjlrfioörhlfrufhrfrjnfklkfldskjfdölfkjdflkdjfdlkfjdsfdsdsklfdjfldkfjdfkldsjfkldjeadSDLMKAFDHNFDJKFDUJKLFEFUddijsfihuklfnlekfbjkfljEREFesfsfdsfdshthtsfdfkldsfjdskfhdfulfhefuklhdsulfkasdhfliudskjfhdfeiufhdsfkjdshfjkdsfhdsifelihwguidlkwhjdksilfjdsbfkjfgbvilayfukjdshlfuiblyjdsailfhkdfvhdkfsdifujhdsulfdfgilykhvfbwiakydvebkfjlkhsbfjehkfvbludkhgbenfukehvfbkjelwheiblykw<bhfshkdvb<kjljdhsifukjdfhudfkjbfiefkevhfilefhlbeifhkeepwoeiwpeowiewjopejöhdswuehaeuilawghdoiwaudgwduigwduigduiJIDAOIUDHEDBJDHNIULKDJDHUKWJDHUIAWLKD<J<ODILHWDIUGFBNIFLYKGVDBLAWIUKDJBWLDIYKWAVHDBLIWYDKHVWABDYIWHKDBWYIuhdjidhudyikgduywdkgh<duilkwgbdlyfskhvdbwvy<dvhwbilydkvwdyulwvhkdkgwdjhvbwkdjwvhdk<wjdsfsfhweuqgbygyujfyitgcfvytukcgfvytgjcvFYCGVYTGFGVBTUKGFVYTKUCGJVYCFHCGKYRJVKTCygfytukyfgrtegyhwajoeilqwhewildbusakdjskldhsdjlsdhaslukdjhsdukejbfhdjfbdshfkjbnfehkbjfhn<libdhkfneshbjfmbznrsedbhkjznawlmöoinf<jclbankwdlbfhvk< wnklebvsehk adwnklfadwjfsejk dawnljgrfbejkag<sfhdfrbhekajwnldavbujh ke.wjknldfbh jdkfh jdqbmnbah webmhdfebajwehdkjebhwhjeabwkh h,afj,fjk.drhneb j,hgrjnksnjlhbdf vhkjsknamwnebjkh fkjenalwdjshb gjnksemadwasjknbfkaemwqjnfbnedwdnefbjk sfe,adkanfb sjef,.kjbc .sej,bf<waj,h<fb fbhmjnd<bhefrhzn<diunfbhvjkrle<aiwkpojiöavöcm<iosukjl kke<wmezjöbkvl<noci rhkea<jk.wdnvkc<jkwjxhjcbjh ,heajwkhfbvhksjeanknvbrkjawndkerjvbkh jadwnk.ejvbk <aej.lnkfjvaekw.dfbjhv <hadjwenvrbkhekawjnlejbhrewdmkldfljbdfk.jkljcilnfhjmucnfkjg,hnfkjd,sbfnskdfsnkajfdhbfkhcjlbakrhweabjnkvb k.jeaknfvbkjw,k.fBK. J<W KH.JCNKSR.JESHBDC,JR<EAHSBDHJ,Rskeahebdhmjc,ehanbe,dh,jb<neakb<sdh,bcne<aj,rvbfvk.e<.ajhrgbfjeahrfbj,e<ahsfbahbfjahmbuiklhegrylekgbfuyhklesbhdlikuqhakwdsja<wukdjbglyw<jkldbqa<efhbdeahedbj,awjhd,vwnabz djhawbn<sh,vnqs ghq<bmsvbazfj,hvsnkezj.<dbhcjhzeszhj,dbjch,ejzndsbj c,hsbejzdns<xjcseh,bjzdjh,ebjzfdh,anbs< j,whbjefh<j ,w<jklvnbjeah<jvshbdsvjkach ,srjed cjvh,zjendbs,jcjefb<ejfdh,ekajeiuawhdualk<gd<eyilkrjehfliöwhdgby<lkjdgaebyhfkjehgdbyhekgfb<wlöhdbilekjfaeblhdjlb<adhkjlhkwdbuiqkaklqjhsdukjlenfkjsb,dfnszöldb<enkjd,bsdkelhfdbkeh,jflkjawhubiedkhfbnawawbuidkhvbjnzrseoiawurfljagkrsåeodminljcnsje8942yhgbf98wh038fbysusidhln3iwuiohdnb3yukejbhn128oq3uihfvn9cuekgjhd98nacesjhfnuwoiq3ujer8oiuhj3rnfuh4rfniuw4krhjfnw3iuhgbiukgutjfgu6yikrf76guyiUYTGUYUKTGUTKYHKTGVYTUYRK3WH8EUKR4HJW37IUEUWIO3WF4EFBEUDIJ8ERHBEYDWUKAHSRGVYHUAEIFSFEUHGAEURSBuekhiifsisgwbj3kaiesrgfebhj3kshugew yjashfhyg3vehbjjkefhilzyiegyjbqhsjfixlueg3yjsxfiuhsjfids<F4>ewgydpewoioepöfndfjmnfdpoefduewjiofjenfbjksjdfkdö-dfkpfiölehfbkejbfdh,fbdhkf,bdjöfdfbjdfjdkfhdfjkdnfjdkfndjfndflask.fne.kfnejf,ebfjkd,bfnlekjfenkfj.ebfjd.fkj.bfdksaopdksödksdsdhsdsdjspdåwkdjoiehdfuhenfsukhföilfrjiöhlföodökfröoifjlrfioörhlfrufhrfrjnfklkfldskjfdölfkjdflkdjfdlkfjdsfdsdsklfdjfldkfjdfkldsjfkldjeadSDLMKAFDHNFDJKFDUJKLFEFUddijsfihuklfnlekfbjkfljEREFesfsfdsfdshthtsfdfkldsfjdskfhdfulfhefuklhdsulfkasdhfliudskjfhdfeiufhdsfkjdshfjkdsfhdsifelihwguidlkwhjdksilfjdsbfkjfgbvilayfukjdshlfuiblyjdsailfhkdfvhdkfsdifujhdsulfdfgilykhvfbwiakydvebkfjlkhsbfjehkfvbludkhgbenfukehvfbkjelwheiblykw<bhfshkdvb<kjljdhsifukjdfhudfkjbfiefkevhfilefhlbeifhkeepwoeiwpeowiewjopejöhdswuehaeuilawghdoiwaudgwduigwduigduiJIDAOIUDHEDBJDHNIULKDJDHUKWJDHUIAWLKD<J<ODILHWDIUGFBNIFLYKGVDBLAWIUKDJBWLDIYKWAVHDBLIWYDKHVWABDYIWHKDBWYIuhdjidhudyikgduywdkgh<duilkwgbdlyfskhvdbwvy<dvhwbilydkvwdyulwvhkdkgwdjhvbwkdjwvhdk<wjdsfsfhweuqgbygyujfyitgcfvytukcgfvytgjcvFYCGVYTGFGVBTUKGFVYTKUCGJVYCFHCGKYRJVKTCygfytukyfgrtegyhwajoeilqwhewildbusakdjskldhsdjlsdhaslukdjhsdukejbfhdjfbdshfkjbnfehkbjfhn<libdhkfneshbjfmbznrsedbhkjznawlmöoinf<jclbankwdlbfhvk< wnklebvsehk adwnklfadwjfsejk dawnljgrfbejkag<sfhdfrbhekajwnldavbujh ke.wjknldfbh jdkfh jdqbmnbah webmhdfebajwehdkjebhwhjeabwkh h,afj,fjk.drhneb j,hgrjnksnjlhbdf vhkjsknamwnebjkh fkjenalwdjshb gjnksemadwasjknbfkaemwqjnfbnedwdnefbjk sfe,adkanfb sjef,.kjbc .sej,bf<waj,h<fb fbhmjnd<bhefrhzn<diunfbhvjkrle<aiwkpojiöavöcm<iosukjl kke<wmezjöbkvl<noci rhkea<jk.wdnvkc<jkwjxhjcbjh ,heajwkhfbvhksjeanknvbrkjawndkerjvbkh jadwnk.ejvbk <aej.lnkfjvaekw.dfbjhv <hadjwenvrbkhekawjnlejbhrewdmkldfljbdfk.jkljcilnfhjmucnfkjg,hnfkjd,sbfnskdfsnkajfdhbfkhcjlbakrhweabjnkvb k.jeaknfvbkjw,k.fBK. J<W KH.JCNKSR.JESHBDC,JR<EAHSBDHJ,Rskeahebdhmjc,ehanbe,dh,jb<neakb<sdh,bcne<aj,rvbfvk.e<.ajhrgbfjeahrfbj,e<ahsfbahbfjahmbuiklhegrylekgbfuyhklesbhdlikuqhakwdsja<wukdjbglyw<jkldbqa<efhbdeahedbj,awjhd,vwnabz djhawbn<sh,vnqs ghq<bmsvbazfj,hvsnkezj.<dbhcjhzeszhj,dbjch,ejzndsbj c,hsbejzdns<xjcseh,bjzdjh,ebjzfdh,anbs< j,whbjefh<j ,w<jklvnbjeah<jvshbdsvjkach ,srjed cjvh,zjendbs,jcjefb<ejfdh,ekajeiuawhdualk<gd<eyilkrjehfliöwhdgby<lkjdgaebyhfkjehgdbyhekgfb<wlöhdbilekjfaeblhdjlb<adhkjlhkwdbuiqkaklqjhsdukjlenfkjsb,dfnszöldb<enkjd,bsdkelhfdbkeh,jflkjawhubiedkhfbnawawbuidkhvbjnzrseoiawurfljagkrsåeodminljcnsje8942yhgbf98wh038fbysusidhln3iwuiohdnb3yukejbhn128oq3uihfvn9cuekgjhd98nacesjhfnuwoiq3ujer8oiuhj3rnfuh4rfniuw4krhjfnw3iuhgbiukgutjfgu6yikrf76guyiUYTGUYUKTGUTKYHKTGVYTUYRK3WH8EUKR4HJW37IUEUWIO3WF4EFBEUDIJ8ERHBEYDWUKAHSRGVYHUAEIFSFEUHGAEURSBuekhiifsisgwbj3kaiesrgfebhj3kshugew yjashfhyg3vehbjjkefhilzyiegyjbqhsjfixlueg3yjsxfiuhsjfids<F4>ewgydpewoioepöfndfjmnfdpoefduewjiofjenfbjksjdfkdö-dfkpfiölehfbkejbfdh,fbdhkf,bdjöfdfbjdfjdkfhdfjkdnfjdkfndjfndflask.fne.kfnejf,ebfjkd,bfnlekjfenkfj.ebfjd.fkj.bfdksaopdksödksdsdhsdsdjspdåwkdjoiehdfuhenfsukhföilfrjiöhlföodökfröoifjlrfioörhlfrufhrfrjnfklkfldskjfdölfkjdflkdjfdlkfjdsfdsdsklfdjfldkfjdfkldsjfkldjeadSDLMKAFDHNFDJKFDUJKLFEFUddijsfihuklfnlekfbjkfljEREFesfsfdsfdshthtsfdfkldsfjdskfhdfulfhefuklhdsulfkasdhfliudskjfhdfeiufhdsfkjdshfjkdsfhdsifelihwguidlkwhjdksilfjdsbfkjfgbvilayfukjdshlfuiblyjdsailfhkdfvhdkfsdifujhdsulfdfgilykhvfbwiakydvebkfjlkhsbfjehkfvbludkhgbenfukehvfbkjelwheiblykw<bhfshkdvb<kjljdhsifukjdfhudfkjbfiefkevhfilefhlbeifhkeepwoeiwpeowiewjopejöhdswuehaeuilawghdoiwaudgwduigwduigduiJIDAOIUDHEDBJDHNIULKDJDHUKWJDHUIAWLKD<J<ODILHWDIUGFBNIFLYKGVDBLAWIUKDJBWLDIYKWAVHDBLIWYDKHVWABDYIWHKDBWYIuhdjidhudyikgduywdkgh<duilkwgbdlyfskhvdbwvy<dvhwbilydkvwdyulwvhkdkgwdjhvbwkdjwvhdk<wjdsfsfhweuqgbygyujfyitgcfvytukcgfvytgjcvFYCGVYTGFGVBTUKGFVYTKUCGJVYCFHCGKYRJVKTCygfytukyfgrtegyhwajoeilqwhewildbusakdjskldhsdjlsdhaslukdjhsdukejbfhdjfbdshfkjbnfehkbjfhn<libdhkfneshbjfmbznrsedbhkjznawlmöoinf<jclbankwdlbfhvk< wnklebvsehk adwnklfadwjfsejk dawnljgrfbejkag<sfhdfrbhekajwnldavbujh ke.wjknldfbh jdkfh jdqbmnbah webmhdfebajwehdkjebhwhjeabwkh h,afj,fjk.drhneb j,hgrjnksnjlhbdf vhkjsknamwnebjkh fkjenalwdjshb gjnksemadwasjknbfkaemwqjnfbnedwdnefbjk sfe,adkanfb sjef,.kjbc .sej,bf<waj,h<fb fbhmjnd<bhefrhzn<diunfbhvjkrle<aiwkpojiöavöcm<iosukjl kke<wmezjöbkvl<noci rhkea<jk.wdnvkc<jkwjxhjcbjh ,heajwkhfbvhksjeanknvbrkjawndkerjvbkh jadwnk.ejvbk <aej.lnkfjvaekw.dfbjhv <hadjwenvrbkhekawjnlejbhrewdmkldfljbdfk.jkljcilnfhjmucnfkjg,hnfkjd,sbfnskdfsnkajfdhbfkhcjlbakrhweabjnkvb k.jeaknfvbkjw,k.fBK. J<W KH.JCNKSR.JESHBDC,JR<EAHSBDHJ,Rskeahebdhmjc,ehanbe,dh,jb<neakb<sdh,bcne<aj,rvbfvk.e<.ajhrgbfjeahrfbj,e<ahsfbahbfjahmbuiklhegrylekgbfuyhklesbhdlikuqhakwdsja<wukdjbglyw<jkldbqa<efhbdeahedbj,awjhd,vwnabz djhawbn<sh,vnqs ghq<bmsvbazfj,hvsnkezj.<dbhcjhzeszhj,dbjch,ejzndsbj c,hsbejzdns<xjcseh,bjzdjh,ebjzfdh,anbs< j,whbjefh<j ,w<jklvnbjeah<jvshbdsvjkach ,srjed cjvh,zjendbs,jcjefb<ejfdh,ekajeiuawhdualk<gd<eyilkrjehfliöwhdgby<lkjdgaebyhfkjehgdbyhekgfb<wlöhdbilekjfaeblhdjlb<adhkjlhkwdbuiqkaklqjhsdukjlenfkjsb,dfnszöldb<enkjd,bsdkelhfdbkeh,jflkjawhubiedkhfbnawawbuidkhvbjnzrseoiawurfljagkrsåeodminljcnsje8942yhgbf98wh038fbysusidhln3iwuiohdnb3yukejbhn128oq3uihfvn9cuekgjhd98nacesjhfnuwoiq3ujer8oiuhj3rnfuh4rfniuw4krhjfnw3iuhgbiukgutjfgu6yikrf76guyiUYTGUYUKTGUTKYHKTGVYTUYRK3WH8EUKR4HJW37IUEUWIO3WF4EFBEUDIJ8ERHBEYDWUKAHSRGVYHUAEIFSFEUHGAEURSBuekhiifsisgwbj4kaiesrgfebhj3kshugew yjashfhyg3vehbjjkefhilzyiegyjbqhsjfixlueg3yjsxfiuhsjfids<F4>ewgy";

var w1 = shuffle(w.split("")).join("");
var w2;

if (true) {
    w2 = shuffle(w.split(""));
    w2[500] = "-";
    w2 = w2.join("");
} else {
    w2 = shuffle(w.split("")).join("");
}

console.log("word length: " + w.length + "\n");
console.log("anagram_jonte: " + anagram_jonte(w1,w2));
console.log("anagram_harald: " + anagram_harald(w1,w2) + "\n");

var rounds = 1000;

var jonte_start = new Date().getTime();
for (i = 0; i < rounds; ++i) {
    anagram_jonte(w1, w2);
}
var jonte_end = new Date().getTime();

var harald_start = new Date().getTime();
for (i = 0; i < rounds; ++i) {
    anagram_harald(w1, w2);
}
var harald_end = new Date().getTime();

console.log("jonte:\t" + (jonte_end - jonte_start) + "ms");
console.log("harald:\t" + (harald_end - harald_start) + "ms");
