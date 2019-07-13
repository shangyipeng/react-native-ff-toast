using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Ff.Toast.RNFfToast
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNFfToastModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNFfToastModule"/>.
        /// </summary>
        internal RNFfToastModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNFfToast";
            }
        }
    }
}
