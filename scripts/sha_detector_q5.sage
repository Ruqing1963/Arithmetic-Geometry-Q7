print("=== Sha Group Dark Matter Scan for Twisted Titan Curve (q=5) ===")
D_values = [1, 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47]

for D in D_values:
    # Construct the twisted Jacobian elliptic curve E^(D) for q=5
    # E^(D): Y^2 = X^3 - 270*D^2*X - 675*D^3
    E = EllipticCurve([-270 * D**2, -675 * D**3])
    
    try:
        # 1. Theoretical upper bound: compute 2-Selmer rank
        selmer_rank = E.selmer_rank()
        
        # 2. True lower bound: compute analytic rank via L-function
        analytic_rank = E.analytic_rank()
        
        # 3. Dark matter detection: if Selmer rank > analytic rank, Sha[2] is non-trivial!
        if selmer_rank > analytic_rank:
            sha_order = E.sha().an()
            status = f"⚠️ Dark Matter Captured! Sha order ≈ {round(sha_order)}"
        else:
            status = "Structurally smooth (Sha = 1)"
            
        print(f"D = {D:<2} | Conductor N = {E.conductor():<7} | Selmer Rank = {selmer_rank} | Analytic Rank = {analytic_rank} | {status}")
        
    except Exception as e:
        print(f"D = {D:<2} | Computation error: {e}")
