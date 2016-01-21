
var verify_device = {
	type_desktop: "desktop",
	type_phone: "phone",
	type_tablet: "tablet",
	agent: {
		mobile: (/Mobile|iP(hone|od|ad)|Android|BlackBerry|IEMobile|Kindle|NetFront|Silk-Accelerated|(hpw|web)OS|Fennec|Minimo|Opera M(obi|ini)|Blazer|Dolfin|Dolphin|Skyfire|Zune/i.test(window.navigator.userAgent)),
		tablet: (/iPad|tablet/i.test(window.navigator.userAgent))
	},
	detect: function () {

		

		/*if (this.type) {
			return;
		}*/
		if (this.agent.mobile) {
			var userAgent = navigator.userAgent.toLowerCase();
			if (userAgent.search("android") > -1) {
				if (userAgent.search("mobile") == -1) {
					this.type = this.type_tablet;
				}
			}
			if (!this.type) {
				this.type = this.type_phone;
			}
		}
		if (this.agent.tablet) {
			this.type = this.type_tablet;
		}
		if (!this.type) {
			this.type = this.type_desktop;
		}



		return this.type
	}
};

// console.log(verify_device.detect())
