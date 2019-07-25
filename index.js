
import { NativeModules } from 'react-native';

const { RNFfToast } = NativeModules;
let FfToast = {};
FfToast.showToast = function (options) {
    let config = {};
    if(!options.callback){
        options.callback = ()=>{
            console.log(11111)
        };
    }
    if(options.config){
        if(options.config.continue == "long"){
            config.shortTimeInterval = 10;
        }
        if(!isNaN(parseFloat(options.config.textFont))){
            config.textFont = options.config.textFont;
        }
        if(options.config.contentColor){
            let rgbaArr = options.config.contentColor.split(",");
            if(rgbaArr.length == 4){
                if(!isNaN(parseFloat(rgbaArr.join("")))){
                    config.contentColor = JSON.parse("[" + String(rgbaArr) + "]");
                }
            }
        }
        if(options.config.boardColor){
            let rgbaArr = options.config.boardColor.split(",");
            if(rgbaArr.length == 4){
                if(!isNaN(parseFloat(rgbaArr.join("")))){
                    config.boardColor = JSON.parse("[" + String(rgbaArr) + "]");
                }
            }
        }
        if(options.config.backBoardColor){
            let rgbaArr = options.config.backBoardColor.split(",");
            if(rgbaArr.length == 4){
                if(!isNaN(parseFloat(rgbaArr.join("")))){
                    config.backBoardColor = JSON.parse("[" + String(rgbaArr) + "]");
                }
            }
        }
        if(options.config.touchEnable){
            config.touchEnable = 1;
        }else{
            config.touchEnable = 0;
        }
    }
    console.log(config);
    console.log(options.iconType);
    switch (options.iconType) {
        case "success":
            RNFfToast.HUDTips(0,options.msg,config,options.callback);
            break;
        case "failed":
            RNFfToast.HUDTips(1,options.msg,config,options.callback);
            break;
        case "tips":
            RNFfToast.HUDTips(2,options.msg,config,options.callback);
            break;
        case "question":
            RNFfToast.HUDTips(3,options.msg,config,options.callback);
            break;
        case "loading1":
            RNFfToast.HUDLoading(6,options.msg,config,options.callback);
            break;
        case "loading2":
            RNFfToast.HUDLoading(7,options.msg,config,options.callback);
            break;
        case "progress":
            console.log(options.progress)
            RNFfToast.HUDProgress(options.progress,options.msg,config,options.callback);
            break;
        default:
            RNFfToast.HUDMsg(options.msg, config, options.callback);
            break;
    }
}
FfToast.clearToast = function () {
    RNFfToast.HUDDismiss();
}
export const showToast = FfToast.showToast;
export const clearToast = FfToast.clearToast;
export default FfToast;
