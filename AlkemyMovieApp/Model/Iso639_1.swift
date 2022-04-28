//
//  Iso639_1.swift
//  AlkemyMovieApp
//
//  Created by Cristian Costa on 24/03/2022.
//

import Foundation

public enum Iso639_1: String, CaseIterable {
    case ab = "ab"
    case aa = "aa"
    case af = "af"
    case ak = "ak"
    case sq = "sq"
    case am = "am"
    case ar = "ar"
    case an = "an"
    case hy = "hy"
    case av = "av"
    case ae = "ae"
    case ay = "ay"
    case az = "az"
    case bm = "bm"
    case ba = "ba"
    case eu = "eu"
    case be = "be"
    case bn = "bn"
    case bh = "bh"
    case bi = "bi"
    case bs = "bs"
    case br = "br"
    case bg = "bg"
    case my = "my"
    case ca = "ca"
    case ch = "ch"
    case ce = "ce"
    case ny = "ny"
    case zh = "zh"
    case cv = "cv"
    case kw = "kw"
    case co = "co"
    case cr = "cr"
    case hr = "hr"
    case cs = "cs"
    case da = "da"
    case dv = "dv"
    case nl = "nl"
    case dz = "dz"
    case en = "en"
    case eo = "eo"
    case et = "et"
    case ee = "ee"
    case fo = "fo"
    case fj = "fj"
    case fi = "fi"
    case fr = "fr"
    case ff = "ff"
    case gl = "gl"
    case ka = "ka"
    case de = "de"
    case el = "el"
    case gn = "gn"
    case gu = "gu"
    case ht = "ht"
    case ha = "ha"
    case he = "he"
    case hz = "hz"
    case hi = "hi"
    case ho = "ho"
    case hu = "hu"
    case ia = "ia"
    case id = "id"
    case ie = "ie"
    case ga = "ga"
    case ig = "ig"
    case ik = "ik"
    case io = "io"
    case `is` = "is"
    case it = "it"
    case iu = "iu"
    case ja = "ja"
    case jv = "jv"
    case kl = "kl"
    case kn = "kn"
    case kr = "kr"
    case ks = "ks"
    case kk = "kk"
    case km = "km"
    case ki = "ki"
    case rw = "rw"
    case ky = "ky"
    case kv = "kv"
    case kg = "kg"
    case ko = "ko"
    case ku = "ku"
    case kj = "kj"
    case la = "la"
    case lb = "lb"
    case lg = "lg"
    case li = "li"
    case ln = "ln"
    case lo = "lo"
    case lt = "lt"
    case lu = "lu"
    case lv = "lv"
    case gv = "gv"
    case mk = "mk"
    case mg = "mg"
    case ms = "ms"
    case ml = "ml"
    case mt = "mt"
    case mi = "mi"
    case mr = "mr"
    case mh = "mh"
    case mn = "mn"
    case na = "na"
    case nv = "nv"
    case nd = "nd"
    case ne = "ne"
    case ng = "ng"
    case nb = "nb"
    case nn = "nn"
    case no = "no"
    case ii = "ii"
    case nr = "nr"
    case oc = "oc"
    case oj = "oj"
    case cu = "cu"
    case om = "om"
    case or = "or"
    case os = "os"
    case pa = "pa"
    case pi = "pi"
    case fa = "fa"
    case pox = "pox"
    case pl = "pl"
    case ps = "ps"
    case pt = "pt"
    case qu = "qu"
    case rm = "rm"
    case rn = "rn"
    case ro = "ro"
    case ru = "ru"
    case sa = "sa"
    case sc = "sc"
    case sd = "sd"
    case se = "se"
    case sm = "sm"
    case sg = "sg"
    case sr = "sr"
    case gd = "gd"
    case sn = "sn"
    case si = "si"
    case sk = "sk"
    case sl = "sl"
    case so = "so"
    case st = "st"
    case es = "es"
    case su = "su"
    case sw = "sw"
    case ss = "ss"
    case sv = "sv"
    case ta = "ta"
    case te = "te"
    case tg = "tg"
    case th = "th"
    case ti = "ti"
    case bo = "bo"
    case tk = "tk"
    case tl = "tl"
    case tn = "tn"
    case to = "to"
    case tr = "tr"
    case ts = "ts"
    case tt = "tt"
    case tw = "tw"
    case ty = "ty"
    case ug = "ug"
    case uk = "uk"
    case ur = "ur"
    case uz = "uz"
    case ve = "ve"
    case vi = "vi"
    case vo = "vo"
    case wa = "wa"
    case cy = "cy"
    case wo = "wo"
    case fy = "fy"
    case xh = "xh"
    case yi = "yi"
    case yo = "yo"
    case za = "za"
    case zu = "zu"
}

extension Iso639_1 {
    public var language: String {
        switch self {
        case .ab: return "Abkhazian"
        case .aa: return "Afar"
        case .af: return "Afrikaans"
        case .ak: return "Akan"
        case .sq: return "Albanian"
        case .am: return "Amharic"
        case .ar: return "Arabic"
        case .an: return "Aragonese"
        case .hy: return "Armenian"
        case .av: return "Avaric"
        case .ae: return "Avestan"
        case .ay: return "Aymara"
        case .az: return "Azerbaijani"
        case .bm: return "Bambara"
        case .ba: return "Bashkir"
        case .eu: return "Basque"
        case .be: return "Belarusian"
        case .bn: return "Bengali"
        case .bh: return "Bihari languages"
        case .bi: return "Bislama"
        case .bs: return "Bosnian"
        case .br: return "Breton"
        case .bg: return "Bulgarian"
        case .my: return "Burmese"
        case .ca: return "Catalan, Valencian"
        case .ch: return "Chamorro"
        case .ce: return "Chechen"
        case .ny: return "Chichewa, Chewa, Nyanja"
        case .zh: return "Chinese"
        case .cv: return "Chuvash"
        case .kw: return "Cornish"
        case .co: return "Corsican"
        case .cr: return "Cree"
        case .hr: return "Croatian"
        case .cs: return "Czech"
        case .da: return "Danish"
        case .dv: return "Divehi, Dhivehi, Maldivian"
        case .nl: return "Dutch, Flemish"
        case .dz: return "Dzongkha"
        case .en: return "English"
        case .eo: return "Esperanto"
        case .et: return "Estonian"
        case .ee: return "Ewe"
        case .fo: return "Faroese"
        case .fj: return "Fijian"
        case .fi: return "Finnish"
        case .fr: return "French"
        case .ff: return "Fulah"
        case .gl: return "Galician"
        case .ka: return "Georgian"
        case .de: return "German"
        case .el: return "Greek (modern),"
        case .gn: return "Guaraní"
        case .gu: return "Gujarati"
        case .ht: return "Haitian, Haitian Creole"
        case .ha: return "Hausa"
        case .he: return "Hebrew (modern),"
        case .hz: return "Herero"
        case .hi: return "Hindi"
        case .ho: return "Hiri Motu"
        case .hu: return "Hungarian"
        case .ia: return "Interlingua"
        case .id: return "Indonesian"
        case .ie: return "Interlingue"
        case .ga: return "Irish"
        case .ig: return "Igbo"
        case .ik: return "Inupiaq"
        case .io: return "Ido"
        case .is: return "Icelandic"
        case .it: return "Italian"
        case .iu: return "Inuktitut"
        case .ja: return "Japanese"
        case .jv: return "Javanese"
        case .kl: return "Kalaallisut, Greenlandic"
        case .kn: return "Kannada"
        case .kr: return "Kanuri"
        case .ks: return "Kashmiri"
        case .kk: return "Kazakh"
        case .km: return "Central Khmer"
        case .ki: return "Kikuyu, Gikuyu"
        case .rw: return "Kinyarwanda"
        case .ky: return "Kirghiz, Kyrgyz"
        case .kv: return "Komi"
        case .kg: return "Kongo"
        case .ko: return "Korean"
        case .ku: return "Kurdish"
        case .kj: return "Kuanyama, Kwanyama"
        case .la: return "Latin"
        case .lb: return "Luxembourgish, Letzeburgesch"
        case .lg: return "Ganda"
        case .li: return "Limburgan, Limburger, Limburgish"
        case .ln: return "Lingala"
        case .lo: return "Lao"
        case .lt: return "Lithuanian"
        case .lu: return "Luba-Katanga"
        case .lv: return "Latvian"
        case .gv: return "Manx"
        case .mk: return "Macedonian"
        case .mg: return "Malagasy"
        case .ms: return "Malay"
        case .ml: return "Malayalam"
        case .mt: return "Maltese"
        case .mi: return "Maori"
        case .mr: return "Marathi"
        case .mh: return "Marshallese"
        case .mn: return "Mongolian"
        case .na: return "Nauru"
        case .nv: return "Navajo, Navaho"
        case .nd: return "North Ndebele"
        case .ne: return "Nepali"
        case .ng: return "Ndonga"
        case .nb: return "Norwegian Bokmål"
        case .nn: return "Norwegian Nynorsk"
        case .no: return "Norwegian"
        case .ii: return "Sichuan Yi, Nuosu"
        case .nr: return "South Ndebele"
        case .oc: return "Occitan"
        case .oj: return "Ojibwa"
        case .cu: return "Church Slavic, Church Slavonic, Old Church Slavonic, Old Slavonic, Old Bulgarian"
        case .om: return "Oromo"
        case .or: return "Oriya"
        case .os: return "Ossetian, Ossetic"
        case .pa: return "Panjabi, Punjabi"
        case .pi: return "Pali"
        case .fa: return "Persian"
        case .pox: return "Polabian"
        case .pl: return "Polish"
        case .ps: return "Pashto, Pushto"
        case .pt: return "Portuguese"
        case .qu: return "Quechua"
        case .rm: return "Romansh"
        case .rn: return "Rundi"
        case .ro: return "Romanian, Moldavian, Moldovan"
        case .ru: return "Russian"
        case .sa: return "Sanskrit"
        case .sc: return "Sardinian"
        case .sd: return "Sindhi"
        case .se: return "Northern Sami"
        case .sm: return "Samoan"
        case .sg: return "Sango"
        case .sr: return "Serbian"
        case .gd: return "Gaelic, Scottish Gaelic"
        case .sn: return "Shona"
        case .si: return "Sinhala, Sinhalese"
        case .sk: return "Slovak"
        case .sl: return "Slovenian"
        case .so: return "Somali"
        case .st: return "Southern Sotho"
        case .es: return "Spanish, Castilian"
        case .su: return "Sundanese"
        case .sw: return "Swahili"
        case .ss: return "Swati"
        case .sv: return "Swedish"
        case .ta: return "Tamil"
        case .te: return "Telugu"
        case .tg: return "Tajik"
        case .th: return "Thai"
        case .ti: return "Tigrinya"
        case .bo: return "Tibetan"
        case .tk: return "Turkmen"
        case .tl: return "Tagalog"
        case .tn: return "Tswana"
        case .to: return "Tonga (Tonga Islands),"
        case .tr: return "Turkish"
        case .ts: return "Tsonga"
        case .tt: return "Tatar"
        case .tw: return "Twi"
        case .ty: return "Tahitian"
        case .ug: return "Uighur, Uyghur"
        case .uk: return "Ukrainian"
        case .ur: return "Urdu"
        case .uz: return "Uzbek"
        case .ve: return "Venda"
        case .vi: return "Vietnamese"
        case .vo: return "Volapük"
        case .wa: return "Walloon"
        case .cy: return "Welsh"
        case .wo: return "Wolof"
        case .fy: return "Western Frisian"
        case .xh: return "Xhosa"
        case .yi: return "Yiddish"
        case .yo: return "Yoruba"
        case .za: return "Zhuang, Chuang"
        case .zu: return "Zulu"
        }
    }
    
    /// Create a new code instance from a language name
    init?(language: String) {
        for code in Iso639_1.allCases {
            if code.language.lowercased() == language.lowercased() {
                self = code
                return
            }
        }
            
        return nil
    }
}
